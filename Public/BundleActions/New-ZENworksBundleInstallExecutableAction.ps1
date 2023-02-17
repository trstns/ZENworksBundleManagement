<#
    .SYNOPSIS
        Install another ZENworks bundle.
    .PARAMETER Name
        Name of the action.
    .PARAMETER Section
        The actions section to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .PARAMETER Command
        The command that should be run on the client workstation.
    .PARAMETER CommandLineParameters
        Any parameters that need to be passed to the command.
    .PARAMETER Impersonate
        Who should the command run as.  
        The options are SYSTEM and USER.

        Defaults to SYSTEM.
    .PARAMETER WaitForExit
        Wait for the command to complete before moving to the next bundle action?

        Defaults to true.
    .PARAMETER WorkingDirectory
        The working directory to use when running the command.
    .PARAMETER SuccessReturnCodes
        A comma separated list of return codes that indicate the command was successful.
    .EXAMPLE
        PS C:\>New-ZENworksBundleLaunchAction -Name "Launch Notepad" -Section "Launch" -Command "C:\Windows\notepad.exe" -Impersonate "USER" -WaitForExit $false

        This example launches notepad on the client workstation.

#>

class InstallExecutableAction {
    [string]$Type = 'Install Executable'
    [string]$Name
    [string]$Section
    [boolean]$ContinueOnFailure = $false
    [string]$FileName
    [string]$Impersonate
    [boolean]$WaitForExit
    [string]$CommandLineParameters
    [string]$SuccessReturnCodes
    [boolean]$IncludeAllFilesinFolder
    [boolean]$IncludeAllFilesinSubFolders
}


function New-ZENworksBundleInstallExecutableAction
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
        [System.String]
        $FileName,
        
        [Parameter()]
        [ValidateSet('SYSTEM','USER')]
        [System.String]
        $Impersonate = "SYSTEM",
        
        [Parameter()]
        [System.Boolean]
        $WaitForExit = $true,
        
        [Parameter()]
        [System.String]
        $CommandLineParameters,
        
        [Parameter()]
        [System.String]
        $SuccessReturnCodes,

        [System.Boolean]
        $IncludeAllFilesinFolder = $false,

        [System.Boolean]
        $IncludeAllFilesinSubFolders = $false

    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleInstallExecutableAction function"
    }

    process
    {
        $BundleAction = New-Object InstallExecutableAction
        $BundleAction.Name = $Name
        $BundleAction.Section = $Section
        $BundleAction.Type = 'Install Executable'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.FileName = $FileName
        $BundleAction.Impersonate = $Impersonate
        $BundleAction.WaitForExit = $WaitForExit
        $BundleAction.CommandLineParameters = $CommandLineParameters
        $BundleAction.SuccessReturnCodes = $SuccessReturnCodes
        $BundleAction.IncludeAllFilesinFolder = $IncludeAllFilesinFolder
        $BundleAction.IncludeAllFilesinSubFolders = $IncludeAllFilesinSubFolders


        return $BundleAction
    }
}
