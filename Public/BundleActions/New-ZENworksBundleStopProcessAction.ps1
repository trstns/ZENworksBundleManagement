<#
    .SYNOPSIS
        Create an action to stop a Windows process.
    .PARAMETER Name
        Name of the action.
    .PARAMETER ActionSet
        The action set to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER ProcessName
        The name of the process to stop.
    .EXAMPLE
        PS C:\>New-ZENworksBundleStopProcessAction -Name "Stop firefox service" -ActionSet "Install" -ProcessName "firefox" -Action "Stop"

        This example stops the firefox process on the client workstation.

#>
class StopProcessAction {
    [string]$Type = 'Stop Process Action'
    [string]$Name
    [string]$ActionSet
    [boolean]$ContinueOnFailure = $false
    [string]$ProcessName
}

function New-ZENworksBundleStopProcessAction
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
        $ActionSet = "Install",

        [Parameter()]
        [System.Boolean]
        $ContinueOnFailure = $false,

        [Parameter(Mandatory = $true)]
        [string]$ProcessName

    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleStopProcessAction function"
    }

    process
    {
        $BundleAction = New-Object StopProcessAction
        $BundleAction.Name = $Name
        $BundleAction.ActionSet = $ActionSet
        $BundleAction.Type = 'Stop Process Action'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.ProcessName = $ProcessName

        return $BundleAction
    }
}
