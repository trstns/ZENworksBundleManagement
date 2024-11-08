<#
    .SYNOPSIS
        Remove previous versions of ZENworks bundles.
    .PARAMETER BundleName
        The name(s) of the new bundle(s) to remove.
    .PARAMETER BundlePath
        The location under /Bundles where the bundle(s) are located.
    .PARAMETER All
        Remove all older versions.
    .PARAMETER Previous
        Remove all versions older than this version.
    .PARAMETER Version
        Remove just this version.        
    .EXAMPLE
        PS C:\>Remove-ZENworksBundleVersion -BundleName "BundleName" -BundlePath "Installs" -Version 3

        Remove version 3 of the bundle named "BundleName" in the Installs folder.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundleVersion -BundleName "BundleName" -BundlePath "Installs" -Previous 3

        Remove all versions older than version 3 of the bundle named "BundleName" in the Installs folder.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundleVersion -BundleName "BundleName" -BundlePath "Installs" -All

        Remove all previous versions of the bundle named "BundleName" in the Installs folder.
    .NOTES
        
#>

function Remove-ZENworksBundleVersion
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $BundleName,

        [Parameter()]
        [System.String]
        $BundlePath,

        [Parameter(ParameterSetName = 'AllVersions')]
        [Switch]
        $All,

        [Parameter(ParameterSetName = 'PreviousVersions')]
        [Int]
        $Previous,

        [Parameter(ParameterSetName = 'SingleVersion')]
        [Int]
        $Version,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )

    begin
    {
        if ("" -ne $BundlePath) 
        {
            # Remove leading slashes and 'Bundles' from the bundle path
            $CleanBundlePath = $BundlePath -Replace "^[\/]?(Bundles)?[\/]?","" 
            # Create properly formatted bundle path
            $FullBundlePath = "/Bundles/{0}/{1}" -f $CleanBundlePath, $BundleName
        }
        else 
        {
            $CleanPath = $BundleName -Replace "^[\/]?(Bundles)?[\/]?",""
            $FullBundlePath =  "/Bundles/{0}" -f $CleanPath
        }
    }
    process
    {
        $ZMANParams = @()
        $ZMANParams += $FullBundlePath

        switch ($PSCmdlet.ParameterSetName) 
        {
            'AllVersions' 
            {
                $ZMANParams += "--all"
                break
            }
            'PreviousVersions' 
            {
                $ZMANParams += "--previous=$Previous"
                break
            }
            'SingleVersion' 
            {
                $ZMANParams += "$Version"
                break
            }
        }
        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-delete-version" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
