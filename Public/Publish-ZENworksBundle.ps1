<#
    .SYNOPSIS
        Published a sandboxed ZENworks bundle.
    .PARAMETER Name
        The name of the new bundle.
    .PARAMETER Path
        The location under /Bundles to place the new bundle.
    .PARAMETER Force
        If a primary bundle has dependent child bundles with the sandbox only version, you must specify this option to publish the changes made both to the primary and the dependent bundles. If you do not specify this option, the publish of the primary bundle also fails.
    .PARAMETER AllChildren
        If a primary bundle has dependent child bundles with the sandbox version, you can specify this option to publish the changes made both to the primary and the dependent child bundles.
    .PARAMETER IncrementAllParents
        If a primary bundle has parent bundles, you can specify this option to increment the version of the parent bundle to apply the newly published changes made to the primary bundle to the devices that are assigned to the parent bundles.
    .PARAMETER ForceParents
        If a primary bundle has parent bundles and you choose to increment the version of the parent bundle, then you must specify this option to publish any of the parent bundles which already have a sandbox version.
    .EXAMPLE
        PS C:\>Publish-ZENworksBundle -Name "BundleName" -Path "Installs"

        Publish the sandbox of a bundle named "BundleName" to a new version.
    .NOTES
        
#>

function Publish-ZENworksBundle
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [System.Boolean]
        $Force = $false,

        [Parameter()]
        [System.Boolean]
        $AllChildren = $false,

        [Parameter()]
        [System.Boolean]
        $IncrementAllParents = $false,

        [Parameter()]
        [System.Boolean]
        $ForceParents = $false,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )

    begin
    {
        # Remove leading slashes and 'Bundles' from the bundle path
        $CleanBundlePath = $Path -Replace "^[\/]?(Bundles)?[\/]?","" 
        # Create properly formatted bundle path
        $FullBundlePath = "/Bundles/{0}/{1}" -f $CleanBundlePath,$Name
    }
    process
    {
        $ZMANParams = @("""$FullBundlePath""")

        if ($Force) {
            $ZMANParams += "--force"
        }
        if ($AllChildren) {
            $ZMANParams += "--all-child"
        }
        if ($IncrementAllParents) {
            $ZMANParams += "--incAllParent"
        }
        if ($ForceParents) {
            $ZMANParams += "--forceParent"
        }

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-sandbox-publish" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
