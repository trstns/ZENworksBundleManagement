<#
    .SYNOPSIS
        Create a bundle requirement to check that a registry value exists.
    .PARAMETER RegistryKeyName
        The registry key that contains the value.
    .PARAMETER ValueName
        The name of the registry value.
    .PARAMETER Operator
        The operator to use.

        Valid values are 'Equals', 'NotEquals', 'LessThan', 'LessEquals', 'GreaterThan' and 'GreaterEquals'
    .PARAMETER Value
        The value to compare against.
    .PARAMETER ValueType
        The type of value we are comparing.

        Valid values are 'String', 'Integer' and 'Version'
    .EXAMPLE
        PS C:\>New-ZENworksBundleRegistryKeyValueRequirement RegistryKeyName "HKEY_LOCAL_MACHINE\SOFTWARE\mozilla.org\Mozilla" -ValueName "CurrentVersion" -Operator "LessEquals" -Value "102.0.1" -ValueType "Version"

        Create a bundle requirement to check that the registry value CurrentVersion in "HKEY_LOCAL_MACHINE\SOFTWARE\mozilla.org\Mozilla" is less than or equal to "102.0.1".
#>

class RegistryKeyValueRequirement {
    [string]$Type = 'RegValueReq'
    [string]$RegistryKeyName
    [string]$ValueName
    [string]$Operator
    [string]$Value
    [string]$ValueType
}

function New-ZENworksBundleRegistryKeyValueRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $RegistryKeyName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ValueName,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Equals', 'NotEquals', 'LessThan', 'LessEquals', 'GreaterThan', 'GreaterEquals')]
        [System.String]
        $Operator,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [Parameter(Mandatory = $true)]
        [ValidateSet('String', 'Integer', 'Version')]
        [System.String]
        $ValueType
    )
    begin
    {
        switch ($ValueType) {
            'String' { $ConvertedValueType = "STRING_TYPE" }
            'Integer' { $ConvertedValueType = "INT_TYPE" }
            'Version' { $ConvertedValueType = "VERSION_TYPE" }
        }
    }

    process
    {
        $BundleRequirement = New-Object RegistryKeyValueRequirement
        $BundleRequirement.RegistryKeyName = $RegistryKeyName
        $BundleRequirement.ValueName = $ValueName
        $BundleRequirement.Operator = $Operator
        $BundleRequirement.Value = $Value
        $BundleRequirement.ValueType = $ConvertedValueType

        return $BundleRequirement
    }
}
