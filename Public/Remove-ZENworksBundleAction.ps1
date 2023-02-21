function Remove-ZENworksBundleAction
{

    <#
    .SYNOPSIS
        Remove one or more actions from an existing ZENworks bundle.
    .PARAMETER BundleName
        The name of the bundle.
    .PARAMETER BundlePath
        The path where the bundle resides.
    .PARAMETER ActionSet
        The action set that contains the action(s) to remove.
    .PARAMETER ActionPositions
        The position number(s) for the action(s) to remove.
    .PARAMETER Credentials
        ZENworks administrator credentials to be able to perform this action.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundleAction -BundleName "Test Bundle" -BundlePath "Installs" -ActionSet Install -ActionPositions 1 -Credential $Credential

        This example will remove the first action in the install action set.
    .EXAMPLE
        PS C:\>Remove-ZENworksBundleAction -BundleName "Test Bundle" -BundlePath "Installs" -ActionSet Install -ActionPositions 1,3 -Credential $Credential
        
        This example will remove the first and third action in the install action set.

    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]$BundleName,

        [Parameter(Mandatory = $true)]
        [String]$BundlePath,

        [Parameter()]
        [ValidateSet('Install','Launch')]
        [String]$ActionSet = 'Install',

        [Parameter(Mandatory = $true)]
        [Int[]]$ActionPositions,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )
    begin
    {
        # Remove leading slashes and 'Bundles' from the bundle path
        $CleanBundlePath = $BundlePath -Replace "^[\/]?(Bundles)?[\/]?","" 
        # Create properly formatted bundle path
        $FullBundlePath = "/Bundles/{0}/{1}" -f $CleanBundlePath,$BundleName
    }
    process
    {
        $ZMANParams = """$FullBundlePath""", $ActionSet, ($ActionPositions -Join ",")

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        $ZMANresult = Invoke-ZMAN -Command "bundle-remove-actions" -CommandOptions $ZMANParams -ZenCredential $Credential

        return $ZMANresult  
    }
}
