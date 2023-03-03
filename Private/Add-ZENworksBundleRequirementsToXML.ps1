<#
    .SYNOPSIS
        Add the XML nodes required for the supplied ZENworks bundle requirements.
    .PARAMETER xmlElement
        The XML element/node to add the new nodes to.
    .PARAMETER Requirements
        An array of requirements objects to be processed.
#>
function Add-ZENworksBundleRequirementsToXML
{
    [OutputType([System.String])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.Xml.XmlNode]
        $xmlElement,

        [Parameter(Mandatory = $true)]
        [Object[]]
        $Requirements
    )

    $DocumentRoot = $xmlElement.OwnerDocument

    $SysReqsElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "SysReqs" -Prefix "ns1" -NamespaceURI "http://www.novell.com/ZENworks/Reqs/v1.0" -Attributes @{"Conjunction"=$Requirements.Conjunction;"xmlns"="http://www.novell.com/ZENworks/Reqs/v1.0"} -Parent $xmlElement
    foreach ($Group in $Requirements.Groups) {
        $GroupElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Req" -Attributes @{"Type"="GroupReq"} -Parent $SysReqsElement
        $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -Parent $GroupElement
        $GroupReqElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "GroupReq" -Prefix "ns1" -NamespaceURI $SysReqsElement.NamespaceURI -Attributes @{"Conjunction"=$Group.Conjunction} -Parent $DataElement
        foreach ($Filter in $Group.Filters) {
            switch ($Filter.Type) {
                "ArchitectureReq" {
                    $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "Req" -Attributes @{"Type"=$Filter.Type} -Parent $GroupReqElement -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name $Filter.Type -Prefix "ns1" -NamespaceURI $GroupReqElement.NamespaceURI -Attributes @{"ValueType"="INT_TYPE"} -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Operator" -TextContent $Filter.Operator),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Value" -TextContent $Filter.Value),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Magnitude" -TextContent "NONE")
                            ))
                        ))
                    )
                }
                "RegKeyAndValueExistsReq" {
                    $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "Req" -Attributes @{"Type"=$Filter.Type} -Parent $GroupReqElement -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name $Filter.Type -Prefix "ns1" -NamespaceURI $GroupReqElement.NamespaceURI -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Value" -TextContent $Filter.Value),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Name" -TextContent $Filter.ValueName),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RegKeyName" -TextContent $Filter.RegistryKeyName)
                            ))
                        ))
                    )
                }
                "RegValueReq" {
                    $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "Req" -Attributes @{"Type"=$Filter.Type} -Parent $GroupReqElement -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name $Filter.Type -Prefix "ns1" -NamespaceURI $GroupReqElement.NamespaceURI -Attributes @{"ValueType"=$Filter.ValueType} -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Operator" -TextContent $Filter.Operator),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Value" -TextContent $Filter.Value),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Magnitude" -TextContent "NONE"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RegistryKeyName" -TextContent $Filter.RegistryKeyName),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "ValueName" -TextContent $Filter.ValueName)
                            ))
                        ))
                    )
                }
                {"ProcessRunningReq", "FileExistsReq", "ServiceExistsReq", "ServiceRunningReq", "RegKeyExistsReq" -eq $_} {
                    $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "Req" -Attributes @{"Type"=$Filter.Type} -Parent $GroupReqElement -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name $Filter.Type -Prefix "ns1" -NamespaceURI $GroupReqElement.NamespaceURI -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Value" -TextContent $Filter.Value),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "Name" -TextContent $Filter.Name)
                            ))
                        ))
                    )
                }

            }
        }
    }
}