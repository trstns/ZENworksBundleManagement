<#
    .SYNOPSIS
        Create a bundle requirement to check if a service exists.
    .PARAMETER Name
        The name of the service.
    .PARAMETER Value
        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleServiceExistsRequirement -Name "Netlogon" -Value "false"

        Create a bundle requirement that checks that the Netlogon service doesn't exist.
#>

class ServiceExistsRequirement {
    [string]$Type = 'ServiceExistsReq'
    [string]$Name
    [string]$Value
}

function New-ZENworksBundleServiceExistsRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

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
        $BundleRequirement = New-Object ServiceExistsRequirement
        $BundleRequirement.Name = $Name
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
