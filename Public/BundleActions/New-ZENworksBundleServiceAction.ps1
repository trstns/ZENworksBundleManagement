<#
    .SYNOPSIS
        Create a service to start or stop a Windows service.
    .PARAMETER Name
        Name of the action.
    .PARAMETER Section
        The actions section to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER ServiceName
        The name of the service.
    .PARAMETER Action
        The action to perform on the service.

        This can either be Start or Stop
    .EXAMPLE
        PS C:\>New-ZENworksBundleServiceAction -Name "Stop spooler service" -Section "Install" -ServiceName "spooler" -Action "Stop"

        This example stops the spooler service on the client workstation.

#>

class ServiceAction {
    [string]$Type = 'Service Action'
    [string]$Name
    [string]$Section
    [boolean]$ContinueOnFailure = $false
    [string]$ServiceName
    [string]$Action
}

function New-ZENworksBundleServiceAction
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [ValidateSet('Install','Launch')]
        [System.String]
        $Section = "Install",

        [Parameter()]
        [System.Boolean]
        $ContinueOnFailure = $false,

        [Parameter(Mandatory = $true)]
        [string]$ServiceName,
        
        [Parameter(Mandatory = $true)]
        [ValidateSet('Start','Stop')]
        [string]$Action


    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleServiceAction function"
    }

    process
    {
        $BundleAction = New-Object ServiceAction
        $BundleAction.Name = $Name
        $BundleAction.Section = $Section
        $BundleAction.Type = 'Service Action'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.ServiceName = $ServiceName
        $BundleAction.Action = $Action

        return $BundleAction
    }
}
