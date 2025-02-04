<#
    .SYNOPSIS
        Add the XML nodes required for the supplied ZENworks bundle actions.
    .PARAMETER xmlElement
        The XML element/node to add the new nodes to.
    .PARAMETER Requirements
        An array of action objects to be processed.
#>
function Add-ZENworksBundleActionsToXML
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
        $Actions
    )

    $DocumentRoot = $xmlElement.OwnerDocument
    foreach ($Action in $Actions) {
        Write-Verbose "Processing Action: $($Action.Name)"
        $actionElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Actions" -NamespaceURI $xmlElement.NamespaceURI -Children (
            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Id" -NamespaceURI $xmlElement.NamespaceURI -TextContent "06dc060157b3c7d2f9d8655f329453d0"),
            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Name" -NamespaceURI $xmlElement.NamespaceURI -TextContent $Action.Name),
            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Type" -NamespaceURI $xmlElement.NamespaceURI -TextContent $Action.Type)
        )


        switch ($Action.Type) {
            "Install MSI Action" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:MSIData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Attributes @{"FileName"=$Action.FileName;"Locale"="someLocale";"NetworkInstall"="false";"PackageName"="somePackageName";"Vendor"="someVendor";"Version"="someVersion"} -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Install" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "CmdLine" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent (" /i ""{0}"" {1} /qn" -f $Action.FileName, $Action.InstallParameters))
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Repair" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "CmdLine" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent (" /f ""{0}"" /qn" -f $Action.FileName))
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Uninstall" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "CmdLine" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent (" /x ""{0}"" /qn" -f $Action.FileName))
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonate" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "SYSTEM"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "WindowAction" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "NORMAL"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "ElevateUserAsAdmin" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                        ))
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent ""))

                break

            }
            "Install Files Action" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement
                $InstallFileDataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:InstallFilesData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Parent $DataElement
                $Action.Files | ForEach-Object {
                    $FileName = $_ | Split-Path -Leaf
                    $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "File" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -parent $InstallFileDataElement -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "FileName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $FileName),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "DestDir" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.DestinationDirectory),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "CreateFilesAsLinks" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "FileAttributes" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "FileAttribute" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Attributes @{"Name"="Hidden";"default"="false"} -TextContent "false"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "FileAttribute" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Attributes @{"Name"="ReadOnly";"default"="false"} -TextContent "false")
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "DestFileName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $FileName),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "CopyOption" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.CopyOption)
                    )
                }
                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "ImpersonateCopy" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Parent $InstallFileDataElement -TextContent "SYSTEM"
                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "CreateAsSingleContent" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Parent $InstallFileDataElement -TextContent "false"

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent ""))

                break
            }
            "File Removal Action" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:FileRemovalActionData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Attributes @{"deleteFolderIfEmpty"="false";"includeSystemFiles"="false";"retryCount"="3";"retrySecondsInterval"="5"} -Children (
                        ($Action.Files | ForEach-Object {
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "File" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $_)
                        })
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))

                break
            }
            "InstallBundle" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:AppActionData" -NamespaceURI "http://novell.com/zenworks/apps/appSchema" -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "ItemID" -NamespaceURI "http://novell.com/zenworks/apps/appSchema" -TextContent ""),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "IgnoreBlackout" -NamespaceURI "http://novell.com/zenworks/apps/appSchema" -TextContent "false"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "any" -NamespaceURI "http://novell.com/zenworks/apps/appSchema" -Attributes @{"xmlns:ns2"="http://www.w3.org/2001/XMLSchema";"xmlns:xsi"="http://www.w3.org/2001/XMLSchema-instance";"xsi:type"="ns2:string"})
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "LinkedObjectIDs" -NamespaceURI $actionElement.NamespaceURI -TextContent ""))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent ""))

                break
            }
            "Launch Action" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:LaunchActionData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Command" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.Command),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonate" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.Impersonate),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "WindowAction" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "NORMAL"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "ElevateUserAsAdmin" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WaitForExit" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.WaitForExit.ToString().ToLower()),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WaitTimeout" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "0"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "TerminateAfterTimeout" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "CommandLine" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.CommandLineParameters),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "UseShellExecute" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "true"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WorkDir" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.WorkingDirectory),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WindowsData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Compatibility" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RunIn256Colors" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RunIn640x480" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "DisableVisualThemes" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "TurnOffAdvancedTextServices" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                            ))
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "SuccessReturnCode" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.SuccessReturnCodes)
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent "b28ab2b26f5d4d843f77ba52e9e1c1ae"))

                break
            }
            "Install Executable" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:InstallExeActionData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Attributes @{"FileName"=$(Split-Path -Path $Action.FileName -Leaf)} -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonate" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Impersonation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.Impersonate),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "WindowAction" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "NORMAL"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "ElevateUserAsAdmin" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WaitForAction" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "WaitForExit" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.WaitForExit.ToString().ToLower()),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "WaitTimeout" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "0"),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "TerminateAfterTimeout" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "CommandLineArgs" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.CommandLineParameters),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "UseShellExecute" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "true"),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "WindowsData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "Compatibility" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RunIn256Colors" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "RunIn640x480" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "DisableVisualThemes" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false"),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "TurnOffAdvancedTextServices" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "false")
                            ))
                        )),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "SuccessReturnCode" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.SuccessReturnCodes)
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent "b28ab2b26f5d4d843f77ba52e9e1c1ae"))

                break
            }
            "Registry Edit Action" {
                if ($Action.HKCUOption -eq "CurrentUser") {
                    $HKCUOption = "true"
                } else {
                    $HKCUOption = "false"
                }

                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement 
                $RegistryEditDataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:RegistryEditData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $DataElement

                # Loop through all of the registry keys/values
                $KeyReg = @() # Array to keep track of which keys we have already created
                foreach ($Entry in $Action.RegistryEntries) {
                    $KeyName = [string]$Entry[0]
                    $ValueName = [string]$Entry[1]
                    $ValueType = [string]$Entry[2]
                    $Value = [string]$Entry[3]

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
                                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "RegistryEditOperation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditDataElement -Children (
                                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "KeyName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $Key),
                                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "KeyOperation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Children (
                                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "OperationForKey" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent "CREATE_IF_NOT_EXISTS")
                                    ))
                                )
                            }
                        }
                        # Add entry to update value

                        Write-Verbose "RegistryEditOperationElement"

                        $RegistryEditOperationElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "RegistryEditOperation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditDataElement -Children (
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "KeyName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $Key),
                            (New-XMLNode -DocumentRoot $DocumentRoot -Name "ValueOperation" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Children (
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "ValueName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $ValueName),
                                (New-XMLNode -DocumentRoot $DocumentRoot -Name "OperationForValue" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent "CREATE")
                            ))
                        )
                        $ValueDataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "ValueData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditOperationElement.ValueOperation
                        
                        switch ($ValueType) {
                            "DWord" {
                                Write-Verbose "DWord"
                                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name $ValueType -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $ValueDataElement -Children (
                                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $Value)
                                )
                                Write-Verbose "finished DWord"
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

                                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name $ValueType -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $ValueDataElement -Children (
                                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $Value),
                                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "Type" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -TextContent $StringType)
                                )
    

                                break
                            }
                            "MultiString" {
                                $ValueTypeElement = New-XMLNode -DocumentRoot $DocumentRoot -Name $ValueType -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $ValueDataElement

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
                                            $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $ValueTypeElement -TextContent $StringValue
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

                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "BackupOption" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditDataElement -TextContent "false"
                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "HkcuOption" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditDataElement -TextContent $HKCUOption
                $null = New-XMLNode -DocumentRoot $DocumentRoot -Name "ResolveEnvRegEditValInUC" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0/RegistryEdit" -Parent $RegistryEditDataElement -TextContent "false"
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Properties" -NamespaceURI $actionElement.NamespaceURI -TextContent "Impersonation=SYSTEM;"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent "b28ab2b26f5d4d843f77ba52e9e1c1ae"))

                break
            }   
            "Service Action" {
                if ($Action.Action -eq "Start") {
                    $ServiceActionToTake = "0"
                } else {
                    $ServiceActionToTake = "1"
                }

                New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:StartStopServiceData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "ServiceName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.ServiceName),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "ActionToTake" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $ServiceActionToTake)
                    ))
                )
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent "b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                break
            }
            "Stop Process Action" {
                $DataElement = New-XMLNode -DocumentRoot $DocumentRoot -Name "Data" -NamespaceURI $actionElement.NamespaceURI -Parent $actionElement -Children (
                    (New-XMLNode -DocumentRoot $DocumentRoot -Name "ns1:StartStopProcessData" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -Children (
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "ProcessName" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent $Action.ProcessName),
                        (New-XMLNode -DocumentRoot $DocumentRoot -Name "ActionToTake" -NamespaceURI "http://www.novell.com/ZENworks/Actions/v1.0" -TextContent "1")
                    ))
                )

                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "ContinueOnFailure" -NamespaceURI $actionElement.NamespaceURI -TextContent $Action.ContinueOnFailure.ToString().ToLower()))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "Enabled" -NamespaceURI $actionElement.NamespaceURI -TextContent "true"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "reqsFailAction" -NamespaceURI $actionElement.NamespaceURI -TextContent "0"))
                [void]$actionElement.AppendChild((New-XMLNode -DocumentRoot $DocumentRoot -Name "actionUniqueId" -NamespaceURI $actionElement.NamespaceURI -TextContent "b28ab2b26f5d4d843f77ba52e9e1c1ae"))
                                
                break
            }

        }
        [void]$xmlElement.AppendChild($actionElement)
    }


}