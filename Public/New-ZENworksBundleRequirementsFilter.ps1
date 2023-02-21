<#
    .SYNOPSIS
        Create a bundle requirements filter object for a ZENworks bundle
    .PARAMETER Type
        The type of filter to use.  
        
        Currently supports 'ArchitectureReq', 'RegValueReq', 'ProcessRunningReq', 'FileExistsReq'
    .PARAMETER Operator
        The operator to use for comparison.  
        
        Valid options are 'Equals'. 
        
        Only required when type is 'ArchitectureReq' or 'RegValueReq'.
    .PARAMETER Value
        The value to compare against.
    .PARAMETER Name
        The name of the object to compare. 
        
        Only required when type is 'RegValueReq', 'ProcessRunningReq' or 'FileExistsReq'
    .PARAMETER RegistryKeyName
        The registry key name where 'name' is located.  
        
        Only required when type is 'RegValueReq'.
    .EXAMPLE
        New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64')

        Create a architecture requirements filter object.
    .EXAMPLE
        New-ZENworksBundleRequirementsFilter -Type 'RegValueReq' -RegistryKeyName 'HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Mozilla Firefox' -Name 'CurrentVersion' -Operator 'Equals' -Value '108.0 (x64 en-GB)')

        Create a registry requirements filter object.
    .EXAMPLE
        New-ZENworksBundleRequirementsFilter -Type 'ProcessRunningReq' -Name 'firefox' -Value 'false')

        Create a process running requirements filter object.
    .EXAMPLE
        New-ZENworksBundleRequirementsFilter -Type 'FileExistsReq' -Name 'C:\Program Files\Mozilla Firefox\firefox.exe' -Value 'true')

        Create a file exists requirements filter object.
#>

class ZENworksBundleRequirementFilter {
    [ValidateSet('ArchitectureReq', 'RegValueReq', 'ProcessRunningReq', 'FileExistsReq')]
    [string]$Type
    [ValidateSet('Equals')]
    [string]$Operator
    [string]$Value
    [string]$Name
    [string]$RegistryKeyName

    ZENworksBundleRequirementFilter() {

    }

    [void]SetArchitecture([string]$Operator, [string]$Value) {
        $this.Type = "ArchitectureReq"
        $This.Operator = $Operator
        $this.Value = $Value
    }

    [void]SetRegValue([string]$RegistryKeyName, [string]$Name, [string]$Operator, [string]$Value) {
        $this.Type = "RegValueReq"
        $this.RegistryKeyName = $RegistryKeyName
        $this.Name = $Name
        $This.Operator = $Operator
        $this.Value = $Value
    }

    [void]SetProcessRunning([string]$Name, [string]$Value) {
        $this.Type = "ProcessRunningReq"
        $This.Name = $Name
        $this.Value = $Value
    }

    [void]SetFileExists([string]$Name, [string]$Value) {
        $this.Type = "FileExistsReq"
        $This.Name = $Name
        $this.Value = $Value
    }
}

function New-ZENworksBundleRequirementsFilter
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('ArchitectureReq', 'RegValueReq', 'ProcessRunningReq', 'FileExistsReq')]
        [System.String]$Type,

        [ValidateSet('Equals', 'NotEquals', 'true', 'false', 'GreaterEquals', 'LessEquals')]
        [System.String]
        $Operator,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [string]
        $Name,

        [string]
        $RegistryKeyName
    )

    process
    {
        $BundleRequirementFilter = New-Object ZENworksBundleRequirementFilter

        switch ($Type) {
            "ArchitectureReq" {
                $BundleRequirementFilter.SetArchitecture($Operator, $Value)
                break
            }
            "RegValueReq" {
                $BundleRequirementFilter.SetRegValue($RegistryKeyName, $Name, $Operator, $Value)
                break
            }
            "ProcessRunningReq" {
                $BundleRequirementFilter.SetProcessRunning($Name, $Value)
                break
            }
            "FileExistsReq" {
                $BundleRequirementFilter.SetFileExists($Name, $Value)
                break
            }

        }
        return $BundleRequirementFilter
    }
}
