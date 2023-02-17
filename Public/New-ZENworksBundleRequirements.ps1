<#
    .SYNOPSIS
        Create a bundle requirements object for a ZENworks bundle
    .PARAMETER Conjunction
        The conjunction to use between the groups.

        Possible values are 'AND' and 'OR'.  The default value is 'OR'.
    .PARAMETER Groups
        An array of requirement group objects.  Use New-ZENworksBundleRequirementsGroup to create the requirement groups.
    .EXAMPLE
        New-ZENworksBundleRequirements -Groups (
            New-ZENworksBundleRequirementsGroup -Filters (
                (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64'),
                (New-ZENworksBundleRequirementsFilter -Type 'ProcessRunningReq' -Name 'Firefox' -Value "false")
            )
        )

        Create a requirements object with a single group.
    .EXAMPLE
        New-ZENworksBundleRequirements -Groups (
            (New-ZENworksBundleRequirementsGroup -Filters (
                (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64')
            )),
            (New-ZENworksBundleRequirementsGroup -Filters (
                (New-ZENworksBundleRequirementsFilter -Type 'ProcessRunningReq' -Name 'Firefox' -Value "false")
            ))
        )

        Create a requirements object with multiple groups.
#>

class ZENworksBundleRequirements {
    [ValidateSet('AND', 'OR')]
    [System.String]$Conjunction

    [object[]]$Groups

    ZENworksBundleRequirements([string]$Conjunction,[object[]]$Groups) {
        $this.Conjunction = $Conjunction
        $this.Groups = $Groups

    }

    [void]AddGroup([object]$Group) {
        $this.Groups += $Group
    }

}

function New-ZENworksBundleRequirements
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [ValidateSet('AND', 'OR')]
        [System.String]$Conjunction = 'OR',

        [Parameter(Mandatory = $true)]
        [Object[]]
        $Groups
    )

    begin {
        foreach ($Group in $Groups){
            if($Group.Conjunction -eq $Conjunction) {
                throw "Group conjunctions must be the opposite of filter conjunctions."
            }
        }
    }
    process
    {
        $BundleRequirement = New-Object ZENworksBundleRequirements($Conjunction,$Groups)

        return $BundleRequirement
    }
}
