<#
    .SYNOPSIS
        Install another ZENworks bundle.
    .PARAMETER Name
        Name of the action.
    .PARAMETER Section
        The actions section to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER BundlePath
        The the path to the bundle in ZENworks.
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .EXAMPLE
        PS C:\>New-ZENworksBundleInstallBundleAction -Name "Install Bundle" -Section "Install" -BundlePath "Installs/Install Software"

        This example installs the bundle /Bundles/Installs/Install Software.

#>

class InstallBundleAction {
    [string]$Type = 'InstallBundle'
    [string]$Name
    [string]$Section
    [boolean]$ContinueOnFailure = $false
    [string]$BundlePath
}

function New-ZENworksBundleInstallBundleAction
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
        $BundlePath

    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleInstallBundleAction function"
    }

    process
    {
        # Make sure that the bundle path starts with /Bundles/
        $CleanBundlePath = $BundlePath -Replace "^[\/]?(Bundles)?[\/]?","/Bundles/" 

        $BundleAction = New-Object InstallBundleAction
        $BundleAction.Name = $Name
        $BundleAction.Section = $Section
        $BundleAction.Type = 'InstallBundle'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.BundlePath = $CleanBundlePath

        return $BundleAction
    }
}
