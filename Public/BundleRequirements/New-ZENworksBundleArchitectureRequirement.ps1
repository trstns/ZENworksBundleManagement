<#
    .SYNOPSIS
        Create a bundle requirement for the computer architecture.
    .PARAMETER Operator
        The operator to use.

        Valid values are 'Equals' and 'NotEquals'
    .PARAMETER Value
        The value to check.

        Valid values are '32' and '64'
    .EXAMPLE
        PS C:\>New-ZENworksBundleArchitectureRequirement -Operator "Equals" -Value "64"

        Create a bundle requirement that the computer architecture be 64bit.

#>

class ArchitectureRequirement {
    [string]$Type = 'ArchitectureReq'
    [string]$Operator
    [string]$Value
}

function New-ZENworksBundleArchitectureRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Equals', 'NotEquals')]
        [System.String]
        $Operator,

        [Parameter(Mandatory = $true)]
        [ValidateSet('32', '64')]
        [System.String]
        $Value
    )
    begin
    {
    }

    process
    {
        $BundleRequirement = New-Object ArchitectureRequirement
        $BundleRequirement.Operator = $Operator
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
