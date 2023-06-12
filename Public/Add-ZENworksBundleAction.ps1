<#
    .SYNOPSIS
        Add new actions to an existing ZENworks Bundle.
    .PARAMETER Name
        The name of the new bundle.
    .PARAMETER Path
        The location under /Bundles to place the new bundle.
    .PARAMETER Actions
        An array of actions to add to the bundle.
    .EXAMPLE
        PS C:\>Add-ZENworksBundleAction -Name "BundleName" -Path "Installs" -Actions $Action1

        This example creates a new bundle called BundleName in /Bundles/Installs with a single action defined in the $Action1 variable.
    .EXAMPLE
          Add-ZENworksBundleAction -Name "Mozilla Firefox ESR - Update" -Path "Installs/Automated" -Description "" -Actions (
            (New-ZENworksBundleInstallMSIAction -Name "Install Application MSI" -ActionSet "Install" -FileName "C:\Application.msi")
          )

        This example demonstrates adding a new MSI install action to an existing bundle.
    .NOTES
        
#>

$script:ZENworksActionSetXML = @"
<?xml version="1.0" encoding="UTF-8"?>
<ns1:ActionSet xmlns:ns1="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
    <Id></Id>
    <Type></Type>
    <Version>1</Version>
    <Modified>false</Modified>
</ns1:ActionSet>
"@

function Add-ZENworksBundleAction
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [Object[]]
        $Actions,
        
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )

    begin
    {
        # Remove leading slashes and 'Bundles' from the bundle path
        $CleanBundlePath = $Path -Replace "^[\/]?(Bundles)?[\/]?","" 
        # Create properly formatted bundle path
        $FullBundlePath = "/Bundles/{0}/{1}" -f $CleanBundlePath,$Name
    }
    process
    {
        $Random = Get-Random
        $ActionSetXMLFiles = @()

        $GroupedActions = $Actions | Group-Object -Property ActionSet
        foreach ($ActionGroup in $GroupedActions) {
            $actionSetXml = [xml] $script:ZENworksActionSetXML
            $actionSetXml.ActionSet.Type = $ActionGroup.Name
            Add-ZENworksBundleActionsToXML -xmlElement $actionSetXml.ActionSet -Actions $ActionGroup.Group
            $actionSetXml = Format-PrettyXML $actionSetXml
            $ActionXMLFile = Join-Path $env:TEMP "$Random.$($ActionGroup.Name)Actions.xml"
            Write-Verbose "$($ActionGroup.Name) Action XML File = $ActionXMLFile"
            Set-Content -Path $ActionXMLFile -Value $actionSetXml
            $ActionSetXMLFiles += $ActionXMLFile
        }

        $ActionContentInfoXMLFile = Join-Path $env:TEMP "$Random.ActionContentInfo.xml"
        Write-Verbose "ActionContentInfo XML File = $ActionContentInfoXMLFile"
        $ActionContentInfoXML = New-ZENworksBundleActionContentInfoXml -Actions $Actions

        $ZMANParams = @("""$FullBundlePath""")
        foreach ($ActionSetXML in $ActionSetXMLFiles) {
            $ZMANParams += """$ActionSetXML"""
        }
        if ($null -ne $ActionContentInfoXML) {
            $ActionContentInfoXML = Format-PrettyXML $ActionContentInfoXML
            Set-Content -Path $ActionContentInfoXMLFile -Value $ActionContentInfoXML
            $ZMANParams += "--actioninfo"
            $ZMANParams += """$ActionContentInfoXMLFile"""
        }
        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        Invoke-ZMAN -Command "bundle-add-actions" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
