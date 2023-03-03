<#
    .SYNOPSIS
        Create a bundle requirement to check if a process is running.
    .PARAMETER Name
        The name of the process.
    .PARAMETER Value
        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleProcessRunningRequirement -Name "firefox" -Value "false"

        Create a bundle requirement that checks that firefox is not running.
#>

class ProcessRunningRequirement {
    [string]$Type = 'ProcessRunningReq'
    [string]$Name
    [string]$Value
}

function New-ZENworksBundleProcessRunningRequirement
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
        $BundleRequirement = New-Object ProcessRunningRequirement
        $BundleRequirement.Name = $Name
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
