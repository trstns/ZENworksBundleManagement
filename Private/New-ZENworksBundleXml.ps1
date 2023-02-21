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

        foreach ($Action in $Actions) {
            Write-Verbose "Processing Action: $($Action.Name)"
            $ActionSet = $bundleXML.Bundle.ActionSets | Where-Object -Property "Type" -eq $Action.ActionSet
            $actionElement = $bundleXML.CreateElement("Actions",$ActionSet.NamespaceURI)
            #$actionElement.InnerXml = New-ZENworksBundleActionXml -Action $Action

            $IdElement = $actionElement.AppendChild(
                $bundleXML.CreateElement("Id",$actionElement.NamespaceURI)
                )
            [void]$IdElement.AppendChild($bundleXML.CreateTextNode("06dc060157b3c7d2f9d8655f329453d0"))
            $NameElement = $actionElement.AppendChild(
                $bundleXML.CreateElement("Name",$actionElement.NamespaceURI)
                )
            [void]$NameElement.AppendChild($bundleXML.CreateTextNode($Action.Name))
            $TypeElement = $actionElement.AppendChild(
                $bundleXML.CreateElement("Type",$actionElement.NamespaceURI)
                )
            [void]$TypeElement.AppendChild($bundleXML.CreateTextNode($Action.Type))

            switch ($Action.Type) {
                "Install MSI Action" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $MSIDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:MSIData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $MSIDataElement.SetAttribute("FileName", $Action.FileName)
                    $MSIDataElement.SetAttribute("Locale","someLocale")
                    $MSIDataElement.SetAttribute("NetworkInstall","false")
                    $MSIDataElement.SetAttribute("PackageName","somePackageName")
                    $MSIDataElement.SetAttribute("Vendor","someVendor")
                    $MSIDataElement.SetAttribute("Version","someVersion")

                    $InstallElement = $MSIDataElement.AppendChild(
                        $bundleXML.CreateElement("Install","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $InstallCmdElement = $InstallElement.AppendChild(
                        $bundleXML.CreateElement("CmdLine","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$InstallCmdElement.AppendChild($bundleXML.CreateTextNode((" /i ""{0}"" {1} /qn" -f $Action.FileName, $Action.InstallParameters)))
                    $RepairElement = $MSIDataElement.AppendChild(
                        $bundleXML.CreateElement("Repair","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $RepairCmdElement = $RepairElement.AppendChild(
                        $bundleXML.CreateElement("CmdLine","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$RepairCmdElement.AppendChild($bundleXML.CreateTextNode((" /f ""{0}"" /qn" -f $Action.FileName)))
                    $UninstallElement = $MSIDataElement.AppendChild(
                        $bundleXML.CreateElement("Uninstall","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $UninstallCmdElement = $UninstallElement.AppendChild(
                        $bundleXML.CreateElement("CmdLine","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$UninstallCmdElement.AppendChild($bundleXML.CreateTextNode((" /x ""{0}"" /qn" -f $Action.FileName)))
                    $ImpersonateElement = $MSIDataElement.AppendChild(
                        $bundleXML.CreateElement("Impersonate","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $ImpersonationElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("Impersonation","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ImpersonationElement.AppendChild($bundleXML.CreateTextNode("SYSTEM"))
                    $WindowActionElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("WindowAction","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WindowActionElement.AppendChild($bundleXML.CreateTextNode("NORMAL"))
                    $ElevateUserAsAdminElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("ElevateUserAsAdmin","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ElevateUserAsAdminElement.AppendChild($bundleXML.CreateTextNode("false"))
                    
                    $LinkedObjectIDsElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("LinkedObjectIDs",$actionElement.NamespaceURI)
                        )
                    [void]$LinkedObjectIDsElement.AppendChild($bundleXML.CreateTextNode("5a8a47f9caffcb03192c0befdd97febf"))
                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break

                }
                "Install Files Action" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $InstallFilesDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:InstallFilesData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileElement = $InstallFilesDataElement.AppendChild(
                        $bundleXML.CreateElement("File","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileNameElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("FileName","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$FileNameElement.AppendChild($bundleXML.CreateTextNode($Action.FileName))
                    $DestDirElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("DestDir","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$DestDirElement.AppendChild($bundleXML.CreateTextNode($Action.DestinationDirectory))
                    $CreateFilesAsLinksElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("CreateFilesAsLinks","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CreateFilesAsLinksElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $ContentUIDElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("ContentUID","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ContentUIDElement.AppendChild($bundleXML.CreateTextNode("4dbc79af33a33c2bf042f4fe66219ad6"))
                    $FileAttributesElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("FileAttributes","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileAttributeHiddenElement = $FileAttributesElement.AppendChild(
                        $bundleXML.CreateElement("FileAttribute","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileAttributeHiddenElement.SetAttribute("Name","Hidden")
                    $FileAttributeHiddenElement.SetAttribute("default","false")
                    [void]$FileAttributeHiddenElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $FileAttributeReadOnlyElement = $FileAttributesElement.AppendChild(
                        $bundleXML.CreateElement("FileAttribute","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileAttributeReadOnlyElement.SetAttribute("Name","ReadOnly")
                    $FileAttributeReadOnlyElement.SetAttribute("default","false")
                    [void]$FileAttributeReadOnlyElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $DestFileNameElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("DestFileName","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$DestFileNameElement.AppendChild($bundleXML.CreateTextNode($Action.DestinationFileName))
                    $CopyOptionElement = $FileElement.AppendChild(
                        $bundleXML.CreateElement("CopyOption","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CopyOptionElement.AppendChild($bundleXML.CreateTextNode($Action.CopyOption))
                    $ImpersonateCopyElement = $InstallFilesDataElement.AppendChild(
                        $bundleXML.CreateElement("ImpersonateCopy","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ImpersonateCopyElement.AppendChild($bundleXML.CreateTextNode("SYSTEM"))
                    $CreateAsSingleContentElement = $InstallFilesDataElement.AppendChild(
                        $bundleXML.CreateElement("CreateAsSingleContent","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CreateAsSingleContentElement.AppendChild($bundleXML.CreateTextNode("false"))

                    $LinkedObjectIDsElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("LinkedObjectIDs",$actionElement.NamespaceURI)
                        )
                    [void]$LinkedObjectIDsElement.AppendChild($bundleXML.CreateTextNode("5a8a47f9caffcb03192c0befdd97febf"))
                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))

                    break

                }
                "File Removal Action" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $FileRemovalActionDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:FileRemovalActionData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $FileRemovalActionDataElement.SetAttribute("deleteFolderIfEmpty", "false")
                    $FileRemovalActionDataElement.SetAttribute("includeSystemFiles","false")
                    $FileRemovalActionDataElement.SetAttribute("retryCount","3")
                    $FileRemovalActionDataElement.SetAttribute("retrySecondsInterval","5")

                    foreach ($File in $Action.Files) {
                        $FileElement = $FileRemovalActionDataElement.AppendChild(
                            $bundleXML.CreateElement("File","http://www.novell.com/ZENworks/Actions/v1.0")
                            )
                        [void]$FileElement.AppendChild($bundleXML.CreateTextNode($File))
                    }
                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    break
                }
                "InstallBundle" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $AppActionDataElement = $DataElement.AppendChild(
                            $bundleXML.CreateElement("ns1:AppActionData","http://novell.com/zenworks/apps/appSchema")
                            )
                    $ItemIDElement = $AppActionDataElement.AppendChild(
                        $bundleXML.CreateElement("ItemID","http://novell.com/zenworks/apps/appSchema")
                        )
                    [void]$ItemIDElement.AppendChild($bundleXML.CreateTextNode("94b43f59fd54f6063e507e7f31e02006"))
                    $IgnoreBlackoutElement = $AppActionDataElement.AppendChild(
                        $bundleXML.CreateElement("IgnoreBlackout","http://novell.com/zenworks/apps/appSchema")
                        )
                    [void]$IgnoreBlackoutElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $anyElement = $AppActionDataElement.AppendChild(
                        $bundleXML.CreateElement("any","http://novell.com/zenworks/apps/appSchema")
                        )
                    $anyElement.SetAttribute("xmlns:ns2","http://www.w3.org/2001/XMLSchema")
                    $anyElement.SetAttribute("xmlns:xsi","http://www.w3.org/2001/XMLSchema-instance")
                    $anyElement.SetAttribute("xsi:type","ns2:string")

                    $LinkedObjectIDsElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("LinkedObjectIDs",$actionElement.NamespaceURI)
                        )
                    [void]$LinkedObjectIDsElement.AppendChild($bundleXML.CreateTextNode("5a8a47f9caffcb03192c0befdd97febf"))
                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }
                "Launch Action" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $LaunchActionDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:LaunchActionData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $CommandElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("Command","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CommandElement.AppendChild($bundleXML.CreateTextNode($Action.Command))
                    $ImpersonateElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("Impersonate","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $ImpersonationElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("Impersonation","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ImpersonationElement.AppendChild($bundleXML.CreateTextNode($Action.Impersonate))
                    $WindowActionElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("WindowAction","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WindowActionElement.AppendChild($bundleXML.CreateTextNode("NORMAL"))   
                    $ElevateUserAsAdminElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("ElevateUserAsAdmin","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ElevateUserAsAdminElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $WaitForExitElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WaitForExit","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WaitForExitElement.AppendChild($bundleXML.CreateTextNode($Action.WaitForExit))
                    $WaitTimeoutElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WaitTimeout","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WaitTimeoutElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $TerminateAfterTimeoutElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("TerminateAfterTimeout","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$TerminateAfterTimeoutElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $CommandLineElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("CommandLine","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CommandLineElement.AppendChild($bundleXML.CreateTextNode($Action.CommandLineParameters))
                    $UseShellExecuteElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("UseShellExecute","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$UseShellExecuteElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $WorkDirElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WorkDir","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WorkDirElement.AppendChild($bundleXML.CreateTextNode($Action.WorkingDirectory))
                    $WindowsDataElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WindowsData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $CompatibilityElement = $WindowsDataElement.AppendChild(
                        $bundleXML.CreateElement("Compatibility","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $RunIn256ColorsElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("RunIn256Colors","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$RunIn256ColorsElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $RunIn640x480Element = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("RunIn640x480","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$RunIn640x480Element.AppendChild($bundleXML.CreateTextNode("false"))
                    $DisableVisualThemesElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("DisableVisualThemes","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$DisableVisualThemesElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $TurnOffAdvancedTextServicesElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("TurnOffAdvancedTextServices","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$TurnOffAdvancedTextServicesElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $SuccessReturnCodeElement = $LaunchActionDataElement.AppendChild(
                        $bundleXML.CreateElement("SuccessReturnCode","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$SuccessReturnCodeElement.AppendChild($bundleXML.CreateTextNode($Action.SuccessReturnCodes))


                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }
                "Install Executable" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $InstallExeActionDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:InstallExeActionData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $InstallExeActionDataElement.SetAttribute("FileName",$Action.FileName)
                    $ImpersonateElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("Impersonate","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $ImpersonationElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("Impersonation","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ImpersonationElement.AppendChild($bundleXML.CreateTextNode($Action.Impersonate))
                    $WindowActionElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("WindowAction","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WindowActionElement.AppendChild($bundleXML.CreateTextNode("NORMAL"))   
                    $ElevateUserAsAdminElement = $ImpersonateElement.AppendChild(
                        $bundleXML.CreateElement("ElevateUserAsAdmin","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ElevateUserAsAdminElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $WaitForActionElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WaitForAction","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $WaitForExitElement = $WaitForActionElement.AppendChild(
                        $bundleXML.CreateElement("WaitForExit","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WaitForExitElement.AppendChild($bundleXML.CreateTextNode($Action.WaitForExit))
                    $WaitTimeoutElement = $WaitForActionElement.AppendChild(
                        $bundleXML.CreateElement("WaitTimeout","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$WaitTimeoutElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $TerminateAfterTimeoutElement = $WaitForActionElement.AppendChild(
                        $bundleXML.CreateElement("TerminateAfterTimeout","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$TerminateAfterTimeoutElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $CommandLineArgsElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("CommandLineArgs","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$CommandLineArgsElement.AppendChild($bundleXML.CreateTextNode($Action.CommandLineParameters))
                    $UseShellExecuteElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("UseShellExecute","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$UseShellExecuteElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $WindowsDataElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("WindowsData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $CompatibilityElement = $WindowsDataElement.AppendChild(
                        $bundleXML.CreateElement("Compatibility","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    $RunIn256ColorsElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("RunIn256Colors","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$RunIn256ColorsElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $RunIn640x480Element = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("RunIn640x480","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$RunIn640x480Element.AppendChild($bundleXML.CreateTextNode("false"))
                    $DisableVisualThemesElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("DisableVisualThemes","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$DisableVisualThemesElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $TurnOffAdvancedTextServicesElement = $CompatibilityElement.AppendChild(
                        $bundleXML.CreateElement("TurnOffAdvancedTextServices","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$TurnOffAdvancedTextServicesElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $SuccessReturnCodeElement = $InstallExeActionDataElement.AppendChild(
                        $bundleXML.CreateElement("SuccessReturnCode","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$SuccessReturnCodeElement.AppendChild($bundleXML.CreateTextNode($Action.SuccessReturnCodes))


                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }
                "Registry Edit Action" {
                    if ($Action.HKCUOption -eq "CurrentUser") {
                        $HKCUOption = "true"
                    } else {
                        $HKCUOption = "false"
                    }

                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $RegistryEditDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:RegistryEditData","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                        )


                    # Loop through all of the registry keys/values
                    $KeyReg = @() # Array to keep track of which keys we have already created
                    foreach ($Entry in $Action.RegistryEntries) {
                        $KeyName = $Entry[0]
                        $ValueName = $Entry[1]
                        $ValueType = $Entry[2]
                        $Value = $Entry[3]

                        # Make sure the value types have the correct case - if the type isn't valid, set to $null
                        switch ($ValueType) {
                            "DWord" { $ValueType = "DWord" ; break }
                            "String" { $ValueType = "String"; $StringType = "String"; break}
                            "Binary" { $ValueType = "String"; $StringType = "Binary"; break}
                            "ExpandableString" { $ValueType = "String"; $StringType = "ExpandString"; break}
                            "Qword" { $ValueType = "String"; $StringType = "Qword"; break}
                            "MultiString" { $ValueType = "MultiString"; break}
                            Default { $ValueType = $null }
                        }

                        # Only process this entry if the ValueType is valid
                        if ($null -ne $ValueType) {
                            # Split the key into parts so they we create each key in the path
                            $SplitKey = $KeyName.Split("\")
                            for ($i = 1; $i -lt $SplitKey.Length; $i++) {
                                $Key = $SplitKey[0..$i] -join "\"
                                if (-not $KeyReg.Contains($Key)) {
                                    $KeyReg += $Key
                                    # Add entry to create key
                                    $RegistryEditOperationElement = $RegistryEditDataElement.AppendChild(
                                        $bundleXML.CreateElement("RegistryEditOperation","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    $KeyNameElement = $RegistryEditOperationElement.AppendChild(
                                        $bundleXML.CreateElement("KeyName","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    [void]$KeyNameElement.AppendChild($bundleXML.CreateTextNode($Key))
                                    $KeyOperationElement = $RegistryEditOperationElement.AppendChild(
                                        $bundleXML.CreateElement("KeyOperation","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    $OperationForKeyElement = $KeyOperationElement.AppendChild(
                                        $bundleXML.CreateElement("OperationForKey","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    [void]$OperationForKeyElement.AppendChild($bundleXML.CreateTextNode("CREATE_IF_NOT_EXISTS"))
                                }
                            }
                            # Add entry to update value
                            $RegistryEditOperationElement = $RegistryEditDataElement.AppendChild(
                                $bundleXML.CreateElement("RegistryEditOperation","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            $KeyNameElement = $RegistryEditOperationElement.AppendChild(
                                $bundleXML.CreateElement("KeyName","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            [void]$KeyNameElement.AppendChild($bundleXML.CreateTextNode($Key))
                            $ValueOperationElement = $RegistryEditOperationElement.AppendChild(
                                $bundleXML.CreateElement("ValueOperation","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            $ValueNameElement = $ValueOperationElement.AppendChild(
                                $bundleXML.CreateElement("ValueName","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            [void]$ValueNameElement.AppendChild($bundleXML.CreateTextNode($ValueName))
                            $OperationForValueElement = $ValueOperationElement.AppendChild(
                                $bundleXML.CreateElement("OperationForValue","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            [void]$OperationForValueElement.AppendChild($bundleXML.CreateTextNode("CREATE"))
                            $ValueDataElement = $ValueOperationElement.AppendChild(
                                $bundleXML.CreateElement("ValueData","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                )
                            
                            switch ($ValueType) {
                                "DWord" {
                                    $ValueTypeElement = $ValueDataElement.AppendChild(
                                        $bundleXML.CreateElement($ValueType,"http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    $DataValueElement = $ValueTypeElement.AppendChild(
                                        $bundleXML.CreateElement("Data","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    [void]$DataValueElement.AppendChild($bundleXML.CreateTextNode($Value))
                                    break
                                }
                                "String" {
                                    # Manipulate the value to suit ZENworks
                                    switch ($StringType) {
                                        "String" {
                                            # Insert nulls and convert to base64
                                            $Bytes = [System.Text.Encoding]::ASCII.GetBytes($Value) | ForEach-Object { 0, $_ }
                                            $Value = [System.Convert]::ToBase64String($Bytes)
                                            break
                                        }
                                        "ExpandString" {
                                            # Insert nulls and convert to base64
                                            $Bytes = [System.Text.Encoding]::ASCII.GetBytes($Value) | ForEach-Object { 0, $_ }
                                            $Value = [System.Convert]::ToBase64String($Bytes)
                                            break
                                        }
                                        Default {
                                            # Just use the incoming value
                                        }
                                    }
                                    $ValueTypeElement = $ValueDataElement.AppendChild(
                                        $bundleXML.CreateElement($ValueType,"http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    $DataValueElement = $ValueTypeElement.AppendChild(
                                        $bundleXML.CreateElement("Data","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                        [void]$DataValueElement.AppendChild($bundleXML.CreateTextNode($Value))
                                    $StringTypeElement = $ValueTypeElement.AppendChild(
                                        $bundleXML.CreateElement("Type","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                        [void]$StringTypeElement.AppendChild($bundleXML.CreateTextNode($StringType))
                                    break
                                }
                                "MultiString" {
                                    $ValueTypeElement = $ValueDataElement.AppendChild(
                                        $bundleXML.CreateElement($ValueType,"http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                        )
                                    # We need to manipulate the value string (from the reg file) into the format the ZENworks expects
                                    $HexMulti = $Value.Split(",") # Create array of the hexidecimal elements
                                    # Remove every second entry as they are just nulls
                                    $HexMulti = 0..($HexMulti.Length) | ForEach-Object {if((($_+1) % 2) -ne 0) {$HexMulti[$_]}}
                                    $HexCache = @() # Create a cache for building each string
                                    $HexMulti | ForEach-Object {
                                        if ($_ -eq "00") {
                                            # Null values separate the different strings. Output the string and reset the cache ready for the next string
                                            if ($HexCache.Length -gt 0) {
                                                # Generate base64 encoded string
                                                $Bytes = $HexCache | ForEach-Object { 0, $_ } # Insert null characters as required by ZENworks
                                                $StringValue = [System.Convert]::ToBase64String($Bytes)
                                                $DataValueElement = $ValueTypeElement.AppendChild(
                                                    $bundleXML.CreateElement("Data","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                                                    )
                                                    [void]$DataValueElement.AppendChild($bundleXML.CreateTextNode($StringValue))
                                                $HexCache = @()
                                            }
                                        } elseif ($null -ne $_) {
                                            $HexCache += [byte]"0x$_" # Convert the hex value into a byte and add to the cache array
                                        }
                                    }
                                    break
                                }
                            }
                            
                        }

                    }

                    $BackupOptionElement = $RegistryEditDataElement.AppendChild(
                        $bundleXML.CreateElement("BackupOption","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                        )
                    [void]$BackupOptionElement.AppendChild($bundleXML.CreateTextNode("false"))
                    $HkcuOptionElement = $RegistryEditDataElement.AppendChild(
                        $bundleXML.CreateElement("HkcuOption","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                        )
                    [void]$HkcuOptionElement.AppendChild($bundleXML.CreateTextNode($HKCUOption))
                    $ResolveEnvRegEditValInUCElement = $RegistryEditDataElement.AppendChild(
                        $bundleXML.CreateElement("ResolveEnvRegEditValInUC","http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit")
                        )
                    [void]$ResolveEnvRegEditValInUCElement.AppendChild($bundleXML.CreateTextNode("false"))



                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $PropertiesElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Properties",$actionElement.NamespaceURI)
                        )
                    [void]$PropertiesElement.AppendChild($bundleXML.CreateTextNode("Impersonation=SYSTEM;"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }   
                "Service Action" {
                    if ($Action.Action -eq "Start") {
                        $ServiceActionToTake = "0"
                    } else {
                        $ServiceActionToTake = "1"
                    }

                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $StartStopServiceDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:StartStopServiceData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )

                    $ServiceNameElement = $StartStopServiceDataElement.AppendChild(
                        $bundleXML.CreateElement("ServiceName","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ServiceNameElement.AppendChild($bundleXML.CreateTextNode($Action.ServiceName))
                    $ActionToTakeElement = $StartStopServiceDataElement.AppendChild(
                        $bundleXML.CreateElement("ActionToTake","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ActionToTakeElement.AppendChild($bundleXML.CreateTextNode($ServiceActionToTake))

                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }
                "Stop Process Action" {
                    $DataElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Data",$actionElement.NamespaceURI)
                        )
                    $StartStopServiceDataElement = $DataElement.AppendChild(
                        $bundleXML.CreateElement("ns1:StartStopProcessData","http://www.novell.com/ZENworks/Actions/v1.0")
                        )

                    $ServiceNameElement = $StartStopServiceDataElement.AppendChild(
                        $bundleXML.CreateElement("ProcessName","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ServiceNameElement.AppendChild($bundleXML.CreateTextNode($Action.ProcessName))
                    $ActionToTakeElement = $StartStopServiceDataElement.AppendChild(
                        $bundleXML.CreateElement("ActionToTake","http://www.novell.com/ZENworks/Actions/v1.0")
                        )
                    [void]$ActionToTakeElement.AppendChild($bundleXML.CreateTextNode("1"))

                    $ContinueOnFailureElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("ContinueOnFailure",$actionElement.NamespaceURI)
                        )
                    [void]$ContinueOnFailureElement.AppendChild($bundleXML.CreateTextNode($Action.ContinueOnFailure))
                    $EnabledElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("Enabled",$actionElement.NamespaceURI)
                        )
                    [void]$EnabledElement.AppendChild($bundleXML.CreateTextNode("true"))
                    $reqsFailActionElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("reqsFailAction",$actionElement.NamespaceURI)
                        )
                    [void]$reqsFailActionElement.AppendChild($bundleXML.CreateTextNode("0"))
                    $actionUniqueIdElement = $actionElement.AppendChild(
                        $bundleXML.CreateElement("actionUniqueId",$actionElement.NamespaceURI)
                        )
                    [void]$actionUniqueIdElement.AppendChild($bundleXML.CreateTextNode("b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                    break
                }

            }
            [void]$ActionSet.AppendChild($actionElement)
        }
        return $bundleXml.OuterXml
    }
    catch
    {   
        throw $PSItem
    }
}


