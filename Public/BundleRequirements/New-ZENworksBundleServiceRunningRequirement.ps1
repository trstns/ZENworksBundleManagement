<#
    .SYNOPSIS
        Create a bundle requirement to check if a service is running.
    .PARAMETER Name
        The name of the service.
    .PARAMETER Value
        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleServiceRunningRequirement -Name "Netlogon" -Value "false"

        Create a bundle requirement that checks that the Netlogon service isn't running.
#>

class ServiceRunningRequirement {
    [string]$Type = 'ServiceRunningReq'
    [string]$Name
    [string]$Value
}

function New-ZENworksBundleServiceRunningRequirement
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
        $BundleRequirement = New-Object ServiceRunningRequirement
        $BundleRequirement.Name = $Name
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
