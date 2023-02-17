<#
    .SYNOPSIS
        Deletes a file from client workstations.
    .PARAMETER Name
        Name of the action.
    .PARAMETER Section
        The actions section to place this action.

        Currently only Install and Launch are supported.
        Defaults to Install
    .PARAMETER FileName
        The file on the client workstations to be deleted.
    .PARAMETER ContinueOnFailure
        Specify whether subsequent actions should run if this action fails.

        Defaults to false.
    .EXAMPLE
        PS C:\>New-ZENworksBundleFileRemovalAction -Name "Delete File" -Section "Install" -FileName "C:\Config.json"

        This example deletes the file C:\Config.json from client workstations.

#>

class FileRemovalAction {
    [string]$Type = 'File Removal Action'
    [string]$Name
    [string]$Section
    [boolean]$ContinueOnFailure = $false
    [string[]]$Files
}

function New-ZENworksBundleFileRemovalAction
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

        [System.String[]]
        $Files
    )
    begin
    {
        Write-Verbose "Starting New-ZENworksBundleFileRemovalAction function"
    }

    process
    {
        $BundleAction = New-Object FileRemovalAction
        $BundleAction.Name = $Name
        $BundleAction.Section = $Section
        $BundleAction.Type = 'File Removal Action'
        $BundleAction.ContinueOnFailure = $ContinueOnFailure
        $BundleAction.Files = $Files
        
        return $BundleAction
    }
}
