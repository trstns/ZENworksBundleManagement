<#
    .SYNOPSIS
        Create a bundle requirements group object for a ZENworks bundle
    .PARAMETER Conjunction
        The conjunction to use between the groups.

        Possible values are 'AND' and 'OR'.  The default value is 'AND'.
    .PARAMETER Filters
        An array of requirement filter objects.  Use New-ZENworksBundleRequirementsFilter to create the requirement filters.
    .EXAMPLE
        New-ZENworksBundleRequirementsGroup -Filters (
            (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64')
        )

        Create a requirements group object with a single filter.
    .EXAMPLE
        New-ZENworksBundleRequirementsGroup -Filters (
            (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64'),
            (New-ZENworksBundleRequirementsFilter -Type 'ProcessRunningReq' -Name 'Firefox' -Value "false")
        )
        
        Create a requirements group object with a multiple filters.
#>

class ZENworksBundleRequirementGroup {
    [ValidateSet('AND', 'OR')]
    [System.String]$Conjunction

    [object[]]$Filters

    ZENworksBundleRequirementGroup([string]$Conjunction,[object[]]$Filters) {
        $this.Conjunction = $Conjunction
        $this.Filters = $Filters
    }


    [void]AddFilter([object]$Filter) {
        $this.Filters += $Filter
    }

}
function New-ZENworksBundleRequirementsGroup
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [ValidateSet('AND', 'OR')]
        [System.String]$Conjunction = 'AND',

        [Parameter(Mandatory = $true)]
        [Object[]]
        $Filters
    )
    begin
    {

    }
    process
    {
        $BundleRequirementGroup = New-Object ZENworksBundleRequirementGroup($Conjunction,$Filters)

        return $BundleRequirementGroup
    }
}
