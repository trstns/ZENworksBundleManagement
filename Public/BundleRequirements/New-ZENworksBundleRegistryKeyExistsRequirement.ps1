<#
    .SYNOPSIS
        Create a bundle requirement to check that a registry key exists.
    .PARAMETER RegistryKeyName
        The registry key to check.
    .PARAMETER Value
        The value to check.

        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleRegistryKeyExistsRequirement RegistryKeyName "HKEY_LOCAL_MACHINE\SOFTWARE\mozilla.org\Mozilla" -Value "true"

        Create a bundle requirement to check that HKEY_LOCAL_MACHINE\SOFTWARE\mozilla.org\Mozilla exists.
#>

class RegistryKeyExistsRequirement {
    [string]$Type = 'RegKeyExistsReq'
    [string]$Name
    [string]$Value
}

function New-ZENworksBundleRegistryKeyExistsRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $RegistryKeyName,

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
        $BundleRequirement = New-Object RegistryKeyExistsRequirement
        $BundleRequirement.Name = $RegistryKeyName
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
