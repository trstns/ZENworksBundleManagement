function New-XMLNode
{
    [OutputType([System.Xml.XmlNode])]
    [CmdletBinding(DefaultParameterSetName = 'EmptyNode')]
    param
    (
        [Parameter(Mandatory = $true, ParameterSetName = 'EmptyNode')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ParentNode')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TextNode')]
        [System.Xml.XmlNode]
        $DocumentRoot,

        [Parameter(Mandatory = $true, ParameterSetName = 'EmptyNode')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ParentNode')]
        [Parameter(Mandatory = $true, ParameterSetName = 'TextNode')]
        [System.String]
        $Name,

        [Parameter(ParameterSetName = 'EmptyNode')]
        [Parameter(ParameterSetName = 'ParentNode')]
        [Parameter(ParameterSetName = 'TextNode')]
        [Hashtable]
        $Attributes,

        [Parameter(ParameterSetName = 'EmptyNode')]
        [Parameter(ParameterSetName = 'ParentNode')]
        [Parameter(ParameterSetName = 'TextNode')]
        [System.String]
        $NamespaceURI,

        [Parameter(ParameterSetName = 'EmptyNode')]
        [Parameter(ParameterSetName = 'ParentNode')]
        [Parameter(ParameterSetName = 'TextNode')]
        [System.Xml.XmlNode]
        $Parent,

        [Parameter(ParameterSetName = 'ParentNode')]
        [System.Xml.XmlNode[]]
        $Children,

        [Parameter(ParameterSetName = 'TextNode')]
        [System.String]
        $TextContent
    )

    # Create empty element
    if ($null -eq $NamespaceURI) {
        $NewElement = $DocumentRoot.CreateElement($Name)

    } else {
        $NewElement = $DocumentRoot.CreateElement($Name,$NamespaceURI)
    }

    # Add in the attributes if provided.
    if ($null -ne $Attributes) {
        foreach ($Attribute in $Attributes.GetEnumerator()) {
            $NewElement.SetAttribute($Attribute.Name,$Attribute.Value)
        }
    }

    # Append any children that have been provided
    foreach ($Child in $Children) {
        [void]$NewElement.AppendChild(
            $Child
        )
    }

    # Append text node if provided.
    if ($null -ne $TextContent) {
        [void]$NewElement.AppendChild(
            $DocumentRoot.CreateTextNode($TextContent)
        )
    }

    # Append the new element to the parent if provided.
    if ($null -ne $Parent) {
        # Append the new element to the parent
        [void]$Parent.AppendChild(
            $NewElement
        )
    }

    # Return the new XML element
    $NewElement
}



<#
$XML = @"
<?xml version="1.0" encoding="UTF-8"?>
<ActionInformation>
</ActionInformation>
"@

$XML = [xml] $XML

#[xml]$XML.ActionInformation | New-XMLNode -DocumentRoot $XML -Name "TestElement" 

#$XML.ActionInformation.AppendChild((New-XMLNode -DocumentRoot $XML -Name "TestElement"))


$NewNode = New-XMLNode -DocumentRoot $XML -Name "ActionSet" -Parent $XML.SelectSingleNode("ActionInformation") -Attributes @{"type"="Install"} -Children (
    (New-XMLNode -DocumentRoot $XML -Name "Action" -Attributes @{"name"="ActionName";"index"=1} -Children (
        (New-XMLNode -DocumentRoot $XML -Name "Content" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
            New-XMLNode -DocumentRoot $XML -Name "ContentFilePath" -TextContent "C:\somefile.exe"
        )),
        (New-XMLNode -DocumentRoot $XML -Name "Content" -Children (
            New-XMLNode -DocumentRoot $XML -Name "ContentFilePath" -TextContent "D:\notreallyafile.exe"
        ))
    ))
)

#$NewNode.AppendChild((New-XMLNode -DocumentRoot $XML -Name "otherinfo" -TextContent "something"))
New-XMLNode -DocumentRoot $XML -Name "otherinfo" -Parent $NewNode 
#[void]$XML.SelectSingleNode("ActionInformation").AppendChild($NewNode)


$XML.OuterXml

#>