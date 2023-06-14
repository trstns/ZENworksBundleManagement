<#
    .SYNOPSIS
        Enable a ZENworks bundle.
    .PARAMETER Name
        The name(s) of the new bundle(s) to enable.
    .PARAMETER Path
        The location under /Bundles to place the new bundle.
    .EXAMPLE
        PS C:\>Enable-ZENworksBundle -Name "BundleName" -Path "Installs"

        Enable the bundle named "BundleName" in the Installs folder.
    .EXAMPLE
        PS C:\>Enable-ZENworksBundle -Name "BundleName1","BundleName2" -Path "Installs"

        Enable multiple bundles in the Installs folder.
    .EXAMPLE
        PS C:\>Enable-ZENworksBundle -Name "/Installs/BundleName" "/Applications/Bundle"

        Enable bundles using their full path.
    .NOTES
        
#>

function Enable-ZENworksBundle
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String[]]
        $Name,

        [Parameter()]
        [System.String]
        $Path,

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
        } else {
            $Name = $Name | ForEach-Object {
                $CleanPath = $_ -Replace "^[\/]?(Bundles)?[\/]?",""
                "/Bundles/{0}" -f $CleanPath
            }
        }
    }
    process
    {
        $ZMANParams = @()
        foreach ($Bundle in $Name) {
            $ZMANParams += $Bundle
        }
        if ("" -ne $Path) {
            $ZMANParams += "--folder=$FullBundlePath"
        }

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-enable" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
