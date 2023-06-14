<#
    .SYNOPSIS
        Get ZENworks bundles.
    .PARAMETER Path
        The location to retrieve bundles from.
    .PARAMETER Recurse
        Also search within subfolders.
    .PARAMETER Filter
        Filter on the bundle name. The wildcards * and ? can be used.
    .PARAMETER MaxResults
        Limit the maximum number of results.  Defaults to 100.
    .EXAMPLE
        PS C:\>Get-ZENworksBundle -Path "Installs"

        List all bundles in the Installs folder.
    .EXAMPLE
        PS C:\>Get-ZENworksBundle -Path "Installs" -Recurse

        List all bundles in the Installs folder and any subfolders.
    .EXAMPLE
        PS C:\>et-ZENworksBundle -Path "Installs" -Filter "Mozilla Firefox*"

        List all bundles that start with "Mozilla Firefox" in the Installs folder.
    .NOTES
        
#>

function Get-ZENworksBundle
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter()]
        [System.String]
        $Path,

        [Parameter()]
        [Switch]
        $Recurse,

        [Parameter()]
        [System.String]
        $Filter,

        [Parameter()]
        [System.Int16]
        $MaxResults = 100,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )

    begin
    {
        if ("" -ne $Path) {
            # Remove leading slashes and 'Bundles' from the bundle path
            $CleanBundlePath = $Path -Replace "^[\/]?(Bundles)?[\/]?","" 
            # Create properly formatted bundle path
            $FullBundlePath = "/Bundles/{0}" -f $CleanBundlePath
        }
    }
    process
    {
        $ZMANParams = @()
        if ($Recurse) {
            $ZMANParams += "--recursive"
        }
        if ($Filter) {
            $ZMANParams += "--namefilter=$Filter"
        }
        $ZMANParams += "--scrollsize=$MaxResults"
        if ("" -ne $Path) {
            $ZMANParams += $FullBundlePath
        }

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-list" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
