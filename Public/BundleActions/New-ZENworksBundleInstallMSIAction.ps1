<#
    .SYNOPSIS
        Creates an action object to install an MSI.
    .PARAMETER Name
        Name of the action.
    .PARAMETER ActionSet
        The action set to place this action.

        Currently only Install and Launch are supported.
    .PARAMETER FileName
        The MSI file to be imported into the bundle and installed.
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER InstallParameters
        Additional paramters to pass to msiexec.
    .PARAMETER IncludeAllFilesinFolder
        Specify whether ZENworks should also include all other files in the folder with the MSI file.
        
        Defaults to false.
    .PARAMETER IncludeAllFilesinSubFolders
        Specify whether ZENworks should also include all other files in subfolders that are located with the MSI file.

        Defaults to false.
    .EXAMPLE
        PS C:\>New-ZENworksBundleInstallMSIAction -Name "Install MSI" -ActionSet "Install" -FileName "C:\MSItoInstall.msi"

        This example creates an action which will install C:\MSItoInstall.msi onto client workstations.

#>

class InstallMSIAction {
    [string]$Type = 'Install MSI Action'
    [string]$Name
    [string]$ActionSet
    [boolean]$ContinueOnFailure = $false
    [string]$FileName
    [string]$InstallParameters
    [boolean]$IncludeAllFilesinFolder
    [boolean]$IncludeAllFilesinSubFolders
}

function New-ZENworksBundleInstallMSIAction
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

        [System.String]
        $InstallParameters,

        [System.Boolean]
        $IncludeAllFilesinFolder = $false,

        [System.Boolean]
        $IncludeAllFilesinSubFolders = $false
    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleInstallMSIAction function"
    }

    process
    {
        $BundleAction = New-Object InstallMSIAction
        $BundleAction.Name = $Name
        $BundleAction.ActionSet = $ActionSet
        $BundleAction.Type = "Install MSI Action"
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.FileName = $FileName
        $BundleAction.InstallParameters = $InstallParameters
        $BundleAction.IncludeAllFilesinFolder = $IncludeAllFilesinFolder
        $BundleAction.IncludeAllFilesinSubFolders = $IncludeAllFilesinSubFolders

        return $BundleAction
    }
}
