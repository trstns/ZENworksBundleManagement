<#
    .SYNOPSIS
        Create a new ZENworks Bundle.
    .PARAMETER Name
        The name of the new bundle.
    .PARAMETER Path
        The location under /Bundles to place the new bundle.
    .PARAMETER Description
        Description of the bundle that will be visible to end users.
    .PARAMETER AdminNotes
        Any notes for the bundle that will only be visible to admins.
    .PARAMETER Requirements
        An object containing the requirements for the bundle.
        Use New-ZENworksBundleRequirements to create it.
    .PARAMETER Actions
        An array of actions that the bundle performs.
        Use New-ZENworksBundleAction to create actions.
    .EXAMPLE
        PS C:\>New-ZENworksBundle -Name "BundleName" -Path "Installs" -Actions $Action1

        This example creates a new bundle called BundleName in /Bundles/Installs with a single action defined in the $Action1 variable.
    .EXAMPLE
        $Requirements = New-ZENworksBundleRequirements -Conjunction "AND" -Groups (
            (New-ZENworksBundleRequirementsGroup -Conjunction "OR" -Filters (
                (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64'),
                (New-ZENworksBundleRequirementsFilter -Type 'ProcessRunningReq' -Name 'Firefox' -Value "false")
            )),
            (New-ZENworksBundleRequirementsGroup -Conjunction "OR" -Filters (
                (New-ZENworksBundleRequirementsFilter -Type 'RegValueReq' -RegistryKeyName 'HKEY_LOCAL_MACHINE\SOFTWARE\mozilla.org\Mozilla' -Name 'CurrentVersion' -Operator 'Equals' -Value '1234')
            ))
        )
    
        $Actions = (
            New-ZENworksBundleAction -ActionSet "Launch" -Name "Install Mozilla Firefox ESR Bundle" -Type 'InstallBundle' -BundlePath "/Installs/Automated/Mozilla Firefox ESR - Install"
        )

        New-ZENworksBundle -Name "Mozilla Firefox ESR - Update" -Path "Installs/Automated" -Description "" -Actions $Actions -Requirements $Requirements

        This example demonstrates creating a new bundle with multiple requirements.
    .NOTES
        
#>

function New-ZENworksBundle
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

        [Parameter()]
        [System.String]
        $Description = "",

        [Parameter()]
        [System.String]
        $AdminNotes = "",

        [Parameter()]
        [Object]
        $Requirements,

        [Parameter(Mandatory = $true)]
        [Object[]]
        $Actions = $null,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )

    begin
    {
        Write-Verbose "Starting New-ZENworksBundle function"

        # Clean slashes from the ends of the path and prepend the root bundles path
        $FullPath = $Path.Trim("/")
        $FullPath = "/Bundles/{0}" -f $FullPath
    }
    process
    {

        Write-Verbose -Message $Name
        Write-Verbose -Message $Path
        Write-Verbose -Message $Description
        Write-Verbose -Message $AdminNotes

        $newBundleParameters = @{
            Name = $Name
            Path = $Path
            Description = $Description
            AdminNotes = $AdminNotes
            Requirements = $Requirements
            Actions = $Actions
        }

        $Random = Get-Random
        $BundleXMLFile = Join-Path $env:TEMP "$Random.xml"
        $ActionContentInfoXMLFile = Join-Path $env:TEMP "$Random.ActionContentInfo.xml"
        Write-Verbose "Bundle XML File = $BundleXMLFile"
        Write-Verbose "Bundle ActionContentInfo XML File = $ActionContentInfoXMLFile"
        $BundleXML = New-ZENworksBundleXml @newBundleParameters
        $BundleXML = $BundleXML -replace " xmlns=""""","" # Hack to fix parsing errors
        $BundleXML = Format-PrettyXML $BundleXML 
        $ActionContentInfoXML = New-ZENworksBundleActionContentInfoXml -Actions $Actions
        Set-Content -Path $BundleXMLFile -Value $BundleXML

        #$ZMANParams = """$Name"" ""$BundleXMLFile"" $FullPath"
        $ZMANParams = """$Name""", """$BundleXMLFile""", "$FullPath"
        if ($null -ne $ActionContentInfoXML) {
            Set-Content -Path $ActionContentInfoXMLFile -Value $ActionContentInfoXML
            $ZMANParams += "--actioninfo"
            $ZMANParams += """$ActionContentInfoXMLFile"""
        }
        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        #Start-Process -FilePath "zman" -Argumentlist $ZMANParams -Wait
        Invoke-ZMAN -Command "bundle-create" -CommandOptions $ZMANParams -ZenCredential $Credential
    }
}
