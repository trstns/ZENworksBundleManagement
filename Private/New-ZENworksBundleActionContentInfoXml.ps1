$script:ValidActions = ('Install MSI Action', 'Install Files Action', 'Install Directory Action', 'InstallBundle', 'Install Executable')


$script:ZENworksBundleActionContentInfoXML = @"
<?xml version="1.0" encoding="UTF-8"?>
<ActionInformation>
</ActionInformation>
"@

<#
    .SYNOPSIS
        Create a string of XML that is needed by ZMAN when importing content into ZENworks..
    .PARAMETER Actions
        An array of action object.
#>
function New-ZENworksBundleActionContentInfoXml
{
    [OutputType([System.String])]
    [CmdletBinding()]
    param
    (
      [Parameter(Mandatory = $true)]
      [Object[]]
      $Actions
    )

    Write-Verbose "Starting New-ZENworksBundleActionContentInfoXml function"

    # Check if we need to generate an ActionContentInfo File
    if (($Actions | Where-Object -Property "Type" -in $script:ValidActions).Count -eq 0) {
        # No ActionContentInfo file needed,
        return $null
    }

    try
    {
      $ActionContentInfoXml = [xml] $script:ZENworksBundleActionContentInfoXML

      foreach ($ActionSet in ("Distribute","Install","Launch")) { 
        $ActionSetActions = $Actions | Where-Object -Property "ActionSet" -EQ $ActionSet
        foreach ($Action in $ActionSetActions) {
            Write-Verbose "Processing Action Content: $($Action.Name)"
            if ($Action.Type -in $script:ValidActions) {
                if ($ActionContentInfoXml.ActionInformation | Where-Object {$_.Actionset.Type -eq $ActionSet}) {
                    $actionSetElement = ($ActionContentInfoXml.ActionInformation | Where-Object {$_.Actionset.Type -eq $ActionSet}).ActionSet
                } else {
                    $actionSetElement = $ActionContentInfoXml.CreateElement("ActionSet")
                    $actionSetElement.SetAttribute("type",$ActionSet)
                    [void]$ActionContentInfoXml.SelectSingleNode("ActionInformation").AppendChild($actionSetElement)
                }
                $ActionElement = $ActionContentInfoXml.CreateElement("Action")
                $ActionElement.SetAttribute("name",$Action.Name)
                $ActionElement.SetAttribute("type",$Action.Type)
                if (($ActionSetActions | Measure-Object).Count -eq 1){
                    $ActionIndex = 1
                } else {
                    $ActionIndex = $ActionSetActions.IndexOf($Action) + 1
                }
                $ActionElement.SetAttribute("index",$ActionIndex)
                [void]$actionSetElement.AppendChild($ActionElement)

                if ($Action.Type -in ('Install MSI Action', 'Install Files Action', 'Install Directory Action', 'Install Executable')) {
                    $ContentElement = $ActionContentInfoXml.CreateElement("Content")
                    [void]$ActionElement.AppendChild($ContentElement)
                    $ContentFilePathElement = $ActionContentInfoXml.CreateElement("ContentFilePath")
                    $ContentFilePathElement.SetAttribute("includeAllFilesinFolder",$Action.IncludeAllFilesinFolder.ToString().ToLower())
                    $ContentFilePathElement.SetAttribute("includeAllFilesinSubFolders",$Action.IncludeAllFilesinSubFolders.ToString().ToLower())
                    if ($Action.Type -in ('Install Files Action', 'Install Executable')) {
                        $ContentFilePathElement.SetAttribute("contentPackageType","3")
                    }
                    $ContentFilePathElement.InnerText = $Action.FileName
                    [void]$ContentElement.AppendChild($ContentFilePathElement)
                } elseif ($Action.Type -in ('InstallBundle')) {
                    # Make sure that the bundle path starts with /Bundles/
                    $BundlePath = $Action.BundlePath -Replace "^[\/]?(Bundles)?[\/]?","/Bundles/" 
                    $DependentBundlePathElement = $ActionElement.AppendChild(
                        $ActionContentInfoXml.CreateElement("DependentBundlePath")
                    )
                    [void]$DependentBundlePathElement.AppendChild($ActionContentInfoXml.CreateTextNode($BundlePath))
                }

            }
          }
    
      }

      return $ActionContentInfoXml.OuterXml
    }
    catch
    {   
        throw $PSItem
    }
}
