$script:ZENworksBundleXML = @"
<?xml version="1.0" encoding="UTF-8"?>
<ns1:Bundle xmlns:ns1="http://novell.com/zenworks/datamodel/objects/bundles" xmlns="http://novell.com/zenworks/datamodel/objects/bundles">
    <ns2:UID xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">8e599333806f74ec48d90d31baefeb54</ns2:UID>
    <ns2:Name xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">BundleName</ns2:Name>
    <ns2:InternalName xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">BundleName</ns2:InternalName>
    <ns2:ParentUID xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">bc7ca623bdbcb52eb404da071c3c5214</ns2:ParentUID>
    <ns2:Path xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">/Bundles/Installs/BundleName</ns2:Path>
    <ns2:InternalPath xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">/~bundles~/Installs/BundleName</ns2:InternalPath>
    <ns2:AdminID xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">Bundles</ns2:AdminID>
    <ns2:Description xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects"></ns2:Description>
    <ns2:PrimaryType xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">Bundle</ns2:PrimaryType>
    <ns2:SubType xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">Windows Bundle</ns2:SubType>
    <ns2:GeneralType xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">2</ns2:GeneralType>
    <ns2:Deletable xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">true</ns2:Deletable>
    <ns2:Undeletable xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">false</ns2:Undeletable>
    <ns2:ErrorWarningStatus xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">2</ns2:ErrorWarningStatus>
    <ns2:ComplianceStatus xmlns:ns2="http://novell.com/zenworks/datamodel/objects" xmlns="http://novell.com/zenworks/datamodel/objects">1</ns2:ComplianceStatus>
    <ns2:IsEnabled xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">true</ns2:IsEnabled>
    <ns2:Version xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">61</ns2:Version>
    <ns2:Revision xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">2</ns2:Revision>
    <ns2:ContentInfoVer xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">851</ns2:ContentInfoVer>
    <ns2:ContentPriority xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">0</ns2:ContentPriority>
    <ns2:NextRevision xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">0</ns2:NextRevision>
    <ns2:Replication xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">2</ns2:Replication>
    <ns2:Sandbox xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">false</ns2:Sandbox>
    <ns2:LinkedObjects xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:type="ns2:LinkedContent">
        <id>5a8a47f9caffcb03192c0befdd97febf</id>
        <Transient>false</Transient>
        <ActionLink>true</ActionLink>
        <ContentUID>067aad5fe4a7e00ecfbfb14e8c6470e7</ContentUID>
    </ns2:LinkedObjects>
    <ns2:SatelliteRep xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">1</ns2:SatelliteRep>
    <ns2:Inheritance xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">12</ns2:Inheritance>
    <ns2:ContentTypeTags xmlns:ns2="http://novell.com/zenworks/datamodel/objects/assignablecontent" xmlns="http://novell.com/zenworks/datamodel/objects/assignablecontent">Windows-Bundle</ns2:ContentTypeTags>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>6856ef274ee6cf1003c7b5d226942940</Id>
        <Type>Terminate</Type>
        <Version>1</Version>
        <Modified>false</Modified>
        <Data>
            <ns1:Terminate xmlns:ns1="http://novell.com/zenworks/apps/appSchema">
                <Enabled xmlns="http://novell.com/zenworks/apps/appSchema">true</Enabled>
            </ns1:Terminate>
        </Data>
        <Actions>
            <Id>a29d13d4e8bcfe058f5b3ff898cfcae6</Id>
            <Type>Terminate Action Prompt</Type>
            <Data>
                <ns1:PromptActionData xmlns:ns1="http://www.novell.com/ZENworks/Actions/v1.0">
                    <PromptFrequency xmlns="http://www.novell.com/ZENworks/Actions/v1.0">PROMPT_ALWAYS</PromptFrequency>
                    <CancelsAllowed xmlns="http://www.novell.com/ZENworks/Actions/v1.0">0</CancelsAllowed>
                    <Timeout xmlns="http://www.novell.com/ZENworks/Actions/v1.0">60</Timeout>
                </ns1:PromptActionData>
            </Data>
            <ContinueOnFailure>false</ContinueOnFailure>
            <Enabled>true</Enabled>
            <Properties> =;</Properties>
            <actionUniqueId>e865021122c4d5b49cb76ec2894441fb</actionUniqueId>
        </Actions>
        <Actions>
            <Id>7044115e1c5c674d243f6be2bd8a6804</Id>
            <Type>Terminate Action</Type>
            <Data>
                <ns1:TerminateActionData xmlns:ns1="http://www.novell.com/ZENworks/Actions/v1.0">
                    <Terminate xmlns="http://www.novell.com/ZENworks/Actions/v1.0">true</Terminate>
                </ns1:TerminateActionData>
            </Data>
            <ContinueOnFailure>false</ContinueOnFailure>
            <Enabled>true</Enabled>
            <Properties> =;</Properties>
            <actionUniqueId>53f882de2c45fe6b5e72d08702a670f7</actionUniqueId>
        </Actions>
    </ns2:ActionSets>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>75f60c87bd1e94834a1682da50bc9f5e</Id>
        <Type>Install</Type>
        <Version>101</Version>
        <Modified>false</Modified>
        <Data>
            <ns1:Install xmlns:ns1="http://novell.com/zenworks/apps/appSchema">
                <InstallOption xmlns="http://novell.com/zenworks/apps/appSchema">InstallPerMachine</InstallOption>
                <AllowedPostpones xmlns="http://novell.com/zenworks/apps/appSchema">3</AllowedPostpones>
            </ns1:Install>
        </Data>
    </ns2:ActionSets>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>90a4f51e2c17028fd80d60e2a8b3ccd4</Id>
        <Type>Launch</Type>
        <Version>10</Version>
        <Modified>false</Modified>
        <Data>
            <ns1:Launch xmlns:ns1="http://novell.com/zenworks/apps/appSchema" />
        </Data>
    </ns2:ActionSets>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>a6199c58fee9e3f029fe240419707fb0</Id>
        <Type>Verify</Type>
        <Version>1</Version>
        <Modified>false</Modified>
        <Actions>
            <Id>32ce294b2308f5f2839d2c777553e899</Id>
            <Type>Verify Install</Type>
            <ContinueOnFailure>false</ContinueOnFailure>
            <Enabled>true</Enabled>
            <Properties> =;</Properties>
            <actionUniqueId>d9dc37ac0596138e0afcc8a32b879729</actionUniqueId>
        </Actions>
    </ns2:ActionSets>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>b553f381a3341795e9ffdb5c140b7f19</Id>
        <Type>Uninstall</Type>
        <Version>1</Version>
        <Modified>false</Modified>
        <Data>
            <ns1:Uninstall xmlns:ns1="http://novell.com/zenworks/apps/appSchema">
                <Enabled xmlns="http://novell.com/zenworks/apps/appSchema">false</Enabled>
                <AllowManual xmlns="http://novell.com/zenworks/apps/appSchema">false</AllowManual>
                <DaysBeforeUninstallWhenNotUsed xmlns="http://novell.com/zenworks/apps/appSchema">-1</DaysBeforeUninstallWhenNotUsed>
                <IgnoreChainedDependencies xmlns="http://novell.com/zenworks/apps/appSchema">false</IgnoreChainedDependencies>
            </ns1:Uninstall>
        </Data>
        <Actions>
            <Id>b2132bac9e3ccebf700c7cc545415156</Id>
            <Type>Undo Install</Type>
            <ContinueOnFailure>false</ContinueOnFailure>
            <Enabled>true</Enabled>
            <Properties> =;</Properties>
            <actionUniqueId>5c55f7334a5293981121f42667e581c0</actionUniqueId>
        </Actions>
    </ns2:ActionSets>
    <ns2:ActionSets xmlns:ns2="http://novell.com/zenworks/datamodel/objects/actions" xmlns="http://novell.com/zenworks/datamodel/objects/actions">
        <Id>fea30a6f484e1afa3e13ccaedd1e3996</Id>
        <Type>Distribution</Type>
        <Version>1</Version>
        <Modified>false</Modified>
        <Actions>
            <Id>b0d471cbcfefe754de7a0a36df609986</Id>
            <Type>Distribute Action</Type>
            <ContinueOnFailure>false</ContinueOnFailure>
            <Enabled>true</Enabled>
            <Properties> =;</Properties>
            <actionUniqueId>2e4f453e3415db34cb0718fc42a1facc</actionUniqueId>
        </Actions>
    </ns2:ActionSets>
    <DisplayName>Mozilla Firefox ESR - Install</DisplayName>
    <CreationDate>2022-06-24T16:36:44</CreationDate>
    <Data>&lt;ns1:ApplicationBundleData xmlns="http://novell.com/zenworks/datamodel/objects/bundles" xmlns:ns1="http://novell.com/zenworks/datamodel/objects/bundles"&gt;&lt;Notes&gt;{0}&lt;/Notes&gt;&lt;IconExt&gt;ico&lt;/IconExt&gt;&lt;AlwaysShowIcon&gt;false&lt;/AlwaysShowIcon&gt;&lt;ShowProgress&gt;false&lt;/ShowProgress&gt;&lt;ForceRunOrder&gt;-1&lt;/ForceRunOrder&gt;&lt;WaitOnForceRun&gt;false&lt;/WaitOnForceRun&gt;&lt;/ns1:ApplicationBundleData&gt;</Data>
    <LicenseTrackingEnabled>false</LicenseTrackingEnabled>
</ns1:Bundle>
"@

<#
    .SYNOPSIS
        Create a string of XML defines a ZENworks bundle.
    .PARAMETER Name
        The name of the bundle.
    .PARAMETER Path
        The path where the bundle will be created.
    .PARAMETER Description
        The bundle description.
    .PARAMETER AdminNotes
        The bundle Administrator Notes.
    .PARAMETER Requirements
        An array of requirements objects.
    .PARAMETER Actions
        An array of action objects.
#>
function New-ZENworksBundleXml
{
    [OutputType([System.String])]
    [CmdletBinding()]
    param
    (
      [Parameter(Mandatory = $true)]
      [System.String]
      $Name,

      [Parameter(Mandatory = $true)]
      [System.String]
      $Path,

      [Parameter()]
      [System.String]
      $Description = "",

      [Parameter()]
      [System.String]
      $AdminNotes = "",

      [Parameter()]
      [Object]
      $Requirements = $null,

      [Parameter()]
      [Object[]]
      $Actions = $null
    )

    Write-Verbose "Starting New-ZENworksBundleXml function"

    try
    {
        $bundleXml = [xml] $script:ZENworksBundleXML
        
        # Remove leading slashes and 'Bundles' from the bundle path
        $CleanBundlePath = $BundlePath -Replace "^[\/]?(Bundles)?[\/]?","" 
        $bundleXML.Bundle.Name."#text" = $Name
        $bundleXML.Bundle.InternalName."#text" = $Name
        $bundleXML.Bundle.Path."#text" = "/Bundles/{0}/{1}" -f $CleanBundlePath, $Name
        $bundleXML.Bundle.InternalPath."#text" = "/~bundles~/{0}/{1}" -f $CleanBundlePath, $Name
        $bundleXml.Bundle.Data = $bundleXml.Bundle.Data -f $AdminNotes

        if ($null -ne $Requirements) {
            Write-Verbose "Processing Requirements"
            #$SysReqsRootElement = $bundleXML.CreateElement("ns2", "SysReqs", "http://novell.com/zenworks/datamodel/objects/assignablecontent")
            $SysReqsRootElement = $bundleXML.CreateElement("ns2:SysReqs", "http://novell.com/zenworks/datamodel/objects/assignablecontent")
            #[void]$bundleXML.Bundle.AppendChild($SysReqsRootElement)
            [void]$bundleXML.Bundle.InsertAfter($SysReqsRootElement, $bundleXml.Bundle.NextRevision)
            $SysReqsElement = $bundleXML.CreateElement("ns1", "SysReqs", "http://www.novell.com/ZENworks/Reqs/v1.0")
            $SysReqsElement.SetAttribute("Conjunction", $Requirements.Conjunction)
            $SysReqsElement.SetAttribute("xmlns", "http://www.novell.com/ZENworks/Reqs/v1.0") # ZENworks requires this extra xmlns to work
            [void]$SysReqsRootElement.AppendChild($SysReqsElement)
            foreach ($Group in $Requirements.Groups) {
                $GroupElement = $bundleXML.CreateElement("Req")
                $GroupElement.SetAttribute("Type","GroupReq")
                [void]$SysReqsElement.AppendChild($GroupElement)
                $DataElement = $bundleXML.CreateElement("Data")
                [void]$GroupElement.AppendChild($DataElement)
                $InnerGroupElement = $bundleXML.CreateElement("ns1:GroupReq")
                $InnerGroupElement.SetAttribute("Conjunction", $Group.Conjunction)
                [void]$DataElement.AppendChild($InnerGroupElement)
                foreach ($Filter in $Group.Filters) {
                    #$FilterXML = New-ZENworksBundleRequirementFilterXml -Filter $Filter
                    #$TempXML = [xml]$FilterXML
                    #write-verbose $TempXML.OuterXml
                    #[void]$InnerGroupElement.AppendChild($TempXML)
                    #$InnerGroupElement.InnerXML += $FilterXML
                    $ReqElement = $bundleXML.CreateElement("Req")
                    $ReqElement.SetAttribute("Type", $Filter.Type)
                    [void]$InnerGroupElement.AppendChild($ReqElement)
                    $ReqDataElement = $bundleXML.CreateElement("Data")
                    [void]$ReqElement.AppendChild($ReqDataElement)
                    switch ($Filter.Type) {
                        "ArchitectureReq" {
                            $FilterElement = $bundleXML.CreateElement("ns1:ArchitectureReq")
                            $FilterElement.SetAttribute("ValueType", "INT_TYPE")
                            [void]$ReqDataElement.AppendChild($FilterElement)
                            $OperatorElement = $bundleXML.CreateElement("Operator")
                            [void]$OperatorElement.AppendChild($bundleXML.CreateTextNode($Filter.Operator))
                            $ValueElement = $bundleXML.CreateElement("Value")
                            [void]$ValueElement.AppendChild($bundleXML.CreateTextNode($Filter.Value))
                            $MagnitudeElement = $bundleXML.CreateElement("Magnitude")
                            [void]$MagnitudeElement.AppendChild($bundleXML.CreateTextNode("NONE"))

                            [void]$FilterElement.AppendChild($OperatorElement)
                            [void]$FilterElement.AppendChild($ValueElement)
                            [void]$FilterElement.AppendChild($MagnitudeElement)
                            break
                        }
                        "ProcessRunningReq" {
                            $FilterElement = $bundleXML.CreateElement("ns1:ProcessRunningReq")
                            [void]$ReqDataElement.AppendChild($FilterElement)
                            $ValueElement = $bundleXML.CreateElement("Value")
                            [void]$ValueElement.AppendChild($bundleXML.CreateTextNode($Filter.Value))
                            $NameElement = $bundleXML.CreateElement("Name")
                            [void]$NameElement.AppendChild($bundleXML.CreateTextNode($Filter.Name))
                            [void]$FilterElement.AppendChild($ValueElement)
                            [void]$FilterElement.AppendChild($NameElement)
                            break
                        }
                    }
                    [void]$ReqDataElement.AppendChild($FilterElement)
                }
            }
        }

        $GroupedActions = $Actions | Group-Object -Property ActionSet
        foreach ($ActionGroup in $GroupedActions) {
            $ActionSet = $bundleXML.Bundle.ActionSets | Where-Object -Property "Type" -eq $ActionGroup.Name
            Add-ZENworksBundleActionsToXML -xmlElement $ActionSet -Actions $ActionGroup.Group
        }
        return $bundleXml.OuterXml
    }
    catch
    {   
        throw $PSItem
    }
}


