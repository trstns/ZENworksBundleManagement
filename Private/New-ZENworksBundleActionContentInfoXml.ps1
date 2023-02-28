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
                    $actionSetElement = New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "ActionSet" -Attributes @{"type"=$ActionSet}
                    [void]$ActionContentInfoXml.SelectSingleNode("ActionInformation").AppendChild($actionSetElement)
                }
                if (($ActionSetActions | Measure-Object).Count -eq 1){
                    $ActionIndex = 1
                } else {
                    $ActionIndex = $ActionSetActions.IndexOf($Action) + 1
                }

                $ActionAttributes = @{
                    "name" = $Action.Name
                    "type" = $Action.Type
                    "index" = $ActionIndex
                }
                $ActionElement = New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "Action" -Attributes $ActionAttributes -Parent $actionSetElement

                if ($Action.Type -in ('Install MSI Action', 'Install Directory Action', 'Install Executable')) {
                    $ContentFilePathAttributes = @{
                        "includeAllFilesinFolder" = $Action.IncludeAllFilesinFolder.ToString().ToLower()
                        "includeAllFilesinSubFolders" = $Action.IncludeAllFilesinSubFolders.ToString().ToLower()
                    }
                    if ($Action.Type -in ('Install Executable')) {
                        $ContentFilePathAttributes.Add("contentPackageType","3")
                    }
                    $null = New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "Content" -Parent $ActionElement -Children (
                        (New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "ContentFilePath" -Parent $ActionElement -Attributes $ContentFilePathAttributes -TextContent $Action.FileName)
                    )
                } elseif ($Action.Type -in ('Install Files Action')) {
                    foreach ($File in $Action.Files) {
                        $ContentFilePathAttributes = @{
                            "includeAllFilesinFolder" = "false"
                            "includeAllFilesinSubFolders" = "false"
                            "contentPackageType" = "3"
                        }
                        $null = New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "Content" -Parent $ActionElement -Children (
                            (New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "ContentFilePath" -Parent $ActionElement -Attributes $ContentFilePathAttributes -TextContent $File)
                        )    
                    }
                } elseif ($Action.Type -in ('InstallBundle')) {
                    # Make sure that the bundle path starts with /Bundles/
                    $BundlePath = $Action.BundlePath -Replace "^[\/]?(Bundles)?[\/]?","/Bundles/" 
                    $null = New-XMLNode -DocumentRoot $ActionContentInfoXml -Name "DependentBundlePath" -Parent $ActionElement -TextContent $BundlePath
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
