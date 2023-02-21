<#
    .SYNOPSIS
        Creates an action object to install an file.
    .PARAMETER Name
        Name of the action.
    .PARAMETER ActionSet
        The action set to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER FileName
        The file to be imported into the bundle and installed.
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER IncludeAllFilesinFolder
        Specify whether ZENworks should also include all other files in the same folder with the file.

        Defaults to false.
    .PARAMETER IncludeAllFilesinSubFolders
        Specify whether ZENworks should also include all other files in subfolders that are located with the file.

        Defaults to false.
    .PARAMETER DestinationDirectory
        The destination directory on the client computer.
    .PARAMETER DestinationFileName
        The name the file should be called when places on the client computer.
    .PARAMETER CopyOption
        Select in which circumstances the file(s) is copied.

        Choose from CopyAlways, CopyIfExists, CopyIfDoesNotExist, CopyIfNewer, CopyIfNewerAndExists, CopyIfNewerVersion, CopyIfDifferent
        Defaults to CopyAlways
    .EXAMPLE
        PS C:\>New-ZENworksBundleInstallFilesAction -Name "Install Config File" -ActionSet "Install" -FileName "C:\Config.json" -DestinationDirectory "C:\Program Files\Software\" -DestinationFileName "Config.json"

        This example creates an action which will install C:\Config.json in C:\Program Files\Software on client workstations.

#>

class InstallFilesAction {
    [string]$Type = 'Install Files Action'
    [string]$Name
    [string]$ActionSet
    [boolean]$ContinueOnFailure = $false
    [string]$FileName
    [boolean]$IncludeAllFilesinFolder
    [boolean]$IncludeAllFilesinSubFolders
    [string]$DestinationDirectory
    [string]$DestinationFileName
    [string]$CopyOption
}

function New-ZENworksBundleInstallFilesAction
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
        [System.String]
        $FileName,

        [System.Boolean]
        $IncludeAllFilesinFolder = $false,

        [System.Boolean]
        $IncludeAllFilesinSubFolders = $false,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DestinationDirectory,

        [Parameter(Mandatory = $true)]
        [System.String]
        $DestinationFileName,

        [ValidateSet('CopyAlways','CopyIfExists','CopyIfDoesNotExist','CopyIfNewer','CopyIfNewerAndExists','CopyIfNewerVersion','CopyIfDifferent')]
        [System.String]
        $CopyOption = "CopyAlways"

    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleInstallFilesAction function"
    }

    process
    {
        $BundleAction = New-Object InstallFilesAction
        $BundleAction.Name = $Name
        $BundleAction.ActionSet = $ActionSet
        $BundleAction.Type = 'Install Files Action'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.FileName = $FileName
        $BundleAction.IncludeAllFilesinFolder = $IncludeAllFilesinFolder
        $BundleAction.IncludeAllFilesinSubFolders = $IncludeAllFilesinSubFolders
        $BundleAction.DestinationDirectory = $DestinationDirectory
        $BundleAction.DestinationFileName = $DestinationFileName
        $BundleAction.CopyOption = $CopyOption

        return $BundleAction
    }
}
