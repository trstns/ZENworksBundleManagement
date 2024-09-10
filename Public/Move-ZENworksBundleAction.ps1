function Move-ZENworksBundleAction
{

    <#
    .SYNOPSIS
        Remove one or more actions from an existing ZENworks bundle.
    .PARAMETER BundleName
        The name of the bundle.
    .PARAMETER BundlePath
        The path where the bundle resides.
    .PARAMETER ActionSet
        The action set that contains the action(s) to move.
    .PARAMETER CurrentPosition
        The position number for the action to move.
    .PARAMETER NewPosition
        The destination position number for the action.
    .PARAMETER SourceActionSet
        The action set that contains the action(s) to move.
    .PARAMETER DestinationActionSet
        The action set that the actions should be moved to.
    .PARAMETER ActionPositions
        The position number(s) for the action(s) to move.
    .PARAMETER Credentials
        ZENworks administrator credentials to be able to perform this action.
    .EXAMPLE
        PS C:\>Move-ZENworksBundleAction -BundleName "Test Bundle" -BundlePath "Installs" -ActionSet Install -CurrentPosition 2 -NewPosition 1 -Credential $Credential

        This example will move the second action in the install action into the first position.
    .EXAMPLE
        PS C:\>Move-ZENworksBundleAction -BundleName "Test Bundle" -BundlePath "Installs" -SourceActionSet Install -DestinationActionSet Launch -ActionPositions 1,3 -Credential $Credential
        
        This example will move the first and third action in the install action set to the launch action set.

    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]$BundleName,

        [Parameter(Mandatory = $true)]
        [String]$BundlePath,

        [Parameter(ParameterSetName="MoveWithinActionSet")]
        [ValidateSet('Install','Launch')]
        [String]$ActionSet = 'Install',

        [Parameter(Mandatory = $true, ParameterSetName="MoveWithinActionSet")]
        [Int]$CurrentPosition,

        [Parameter(Mandatory = $true, ParameterSetName="MoveWithinActionSet")]
        [Int]$NewPosition,

        [Parameter(Mandatory = $true, ParameterSetName="MoveBetweenActionSets")]
        [ValidateSet('Install','Launch')]
        [String]$SourceActionSet,

        [Parameter(Mandatory = $true, ParameterSetName="MoveBetweenActionSets")]
        [ValidateSet('Install','Launch')]
        [String]$DestinationActionSet,

        [Parameter(Mandatory = $true, ParameterSetName="MoveBetweenActionSets")]
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
        if ( $PsCmdlet.ParameterSetName -eq "MoveWithinActionSet") {
            $Command = "bundle-reorder-actions"
            $ZMANParams += """$FullBundlePath""", $ActionSet, $CurrentPosition, $NewPosition
        } else {
            $Command = "bundle-relocate-actions"
            $ZMANParams += """$FullBundlePath""", $SourceActionSet, $DestinationActionSet, ($ActionPositions -Join ",")
        }

        Write-Verbose "Launching ZMAN with command ""$Command"" and params: $ZMANParams"
        $ZMANresult = Invoke-ZMAN -Command $Command -CommandOptions $ZMANParams -ZenCredential $Credential

        return $ZMANresult  
    }
}
