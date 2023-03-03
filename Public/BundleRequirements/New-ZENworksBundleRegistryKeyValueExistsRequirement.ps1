<#
    .SYNOPSIS
        Create a bundle requirement to check that a registry value exists.
    .PARAMETER RegistryKeyName
        The registry key that contains the value.
    .PARAMETER ValueName
        The name of the registry value.
    .PARAMETER Value
        The value to check.

        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleRegistryKeyValueExistsRequirement RegistryKeyName "HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla Firefox ESR" -ValueName "CurrentVersion" -Value "true"

        Create a bundle requirement to check that the registry value CurrentVersion exists in "HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla Firefox ESR".
#>

class RegistryKeyValueExistsRequirement {
    [string]$Type = 'RegKeyAndValueExistsReq'
    [string]$RegistryKeyName
    [string]$ValueName
    [string]$Value
}

function New-ZENworksBundleRegistryKeyValueExistsRequirement
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
        [ValidateSet('true', 'false')]
        [System.String]
        $Value
    )
    begin
    {
       
    }

    process
    {
        $BundleRequirement = New-Object RegistryKeyValueExistsRequirement
        $BundleRequirement.RegistryKeyName = $RegistryKeyName
        $BundleRequirement.ValueName = $ValueName
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
