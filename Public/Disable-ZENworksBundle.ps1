<#
    .SYNOPSIS
        Disable a ZENworks bundle.
    .PARAMETER Name
        The name(s) of the new bundle(s) to disable.
    .PARAMETER Path
        The location under /Bundles to place the new bundle.
    .EXAMPLE
        PS C:\>Disable-ZENworksBundle -Name "BundleName" -Path "Installs"

        Disable the bundle named "BundleName" in the Installs folder.
    .EXAMPLE
        PS C:\>Disable-ZENworksBundle -Name "BundleName1","BundleName2" -Path "Installs"

        Disable multiple bundles in the Installs folder.
    .EXAMPLE
        PS C:\>Disable-ZENworksBundle -Name "/Installs/BundleName" "/Applications/Bundle"

        Disable bundles using their full path.
    .NOTES
        
#>

function Disable-ZENworksBundle
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
        Invoke-ZMAN -Command "bundle-disable" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
