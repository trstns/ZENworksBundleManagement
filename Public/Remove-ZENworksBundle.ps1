<#
    .SYNOPSIS
        Remove ZENworks bundles.
    .PARAMETER Name
        The name(s) of the new bundle(s) to remove.
    .PARAMETER Path
        The location under /Bundles where the bundle(s) are located.
    .PARAMETER Recurse
        Also look in subfolders for bundles to delete.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundle -Name "BundleName" -Path "Installs"

        Remove the bundle named "BundleName" in the Installs folder.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundle -Name "BundleName1","BundleName2" -Path "Installs"

        Remove multiple bundles in the Installs folder.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundle -Name "/Installs/BundleName" "/Applications/Bundle"

        Remove bundles using their full path.
    .NOTES
        
#>

function Remove-ZENworksBundle
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

        [Parameter()]
        [Switch]
        $Recurse,

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
            # If a path has not been provided, we assume that all supplied names include the full path
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
        if ($Recurse) {
            $ZMANParams += "--recursive"
        }
        if ("" -ne $Path) {
            $ZMANParams += "--folder=$FullBundlePath"
        }

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-delete" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
