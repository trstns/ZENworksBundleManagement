<#
    .SYNOPSIS
        Creates an action to insert or edit registry entries.
    .PARAMETER Name
        Name of the action.
    .PARAMETER ActionSet
        The action set to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER RegistryEntries
        An array of registry entries that should be created/updated.

        Each entry should be an array with the following format:
        @(Registry Key,Value Name,Type,Value)

        For example:
        @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\MultiMedia","RemoteAudioReceiveEnabled","DWord",1)

        Supported Types are:
        - DWord
        - String
        - Binary
        - ExpandableString
        - Qword
        - MultiString

        The supported value formats are same as provided in a registry export
    .PARAMETER HKCUOption
        Specify weather HKEY_Current_User entries are applied to the default user profile, or the current user profile.
        Support values are 'DefaultUser' and 'CurrentUser'
        The default value is 'DefaultUser'
    .EXAMPLE
        New-ZENworksBundleRegistryEditAction -ActionSet "Install" -Name "Edit the registry"  -RegistryEntries @(
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\MultiMedia","RemoteAudioReceiveEnabled","DWord",1),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\MultiMedia","OtherValue","DWord",2),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","Interaction1","DWord",1),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","StringValue","String","This is some text"),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","BinaryValue","Binary","53,74,72,69,6e,67"),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","QwordValue","Qword","02,00,00,00,00,00,00,00"),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","ExpandStringValue","ExpandString","61,00,73,00,64,00,61,00,73,00,64,00,61,00,73,00,64,00,00,00"),
            @("HKEY_CURRENT_USER\SOFTWARE\TeamViewer\InteractionDefaults","MultiStringValue","MultiString","53,00,74,00,72,00,69,00,6e,00,67,00,31,00,00,00,53,00,74,00,72,00,69,00,6e,00,67,00,32,00,00,00,53,00,74,00,72,00,69,00,6e,00,67,00,33,00,00,00,00,00")
        )

#>

class RegistryEditAction {
    [string]$Type = 'Registry Edit Action'
    [string]$Name
    [string]$ActionSet
    [boolean]$ContinueOnFailure = $false
    [array[]]$RegistryEntries
    [string]$HKCUOption
}

function New-ZENworksBundleRegistryEditAction
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
        [Array[]]
        $RegistryEntries,

        [ValidateSet('DefaultUser','CurrentUser')]
        [System.String]
        $HKCUOption = "DefaultUser"

    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleInstallFilesAction function"
    }

    process
    {
        $BundleAction = New-Object RegistryEditAction
        $BundleAction.Name = $Name
        $BundleAction.ActionSet = $ActionSet
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.RegistryEntries = $RegistryEntries
        $BundleAction.HKCUOption = $HKCUOption

        return $BundleAction
    }
}
