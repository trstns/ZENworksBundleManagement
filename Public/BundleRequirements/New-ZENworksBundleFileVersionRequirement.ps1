<#
    .SYNOPSIS
        Create a bundle requirement to check if file or folder exists.
    .PARAMETER Name
        The full path of the file or folder.
    .PARAMETER Value
        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleFileVersionRequirement -Name "C:\Windows\notepad.exe" -Operator "GreaterThan" -Value "1.0.0"

        Create a bundle requirement that checks that C:\Windows\notepad.exe exists.
#>

class FileVersionRequirement {
    [string]$Type = 'FileVersionReq'
    [string]$FileName
    [string]$Operator
    [string]$Value
}

function New-ZENworksBundleFileVersionRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $FileName,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Equals', 'NotEquals', 'LessThan', 'LessEquals', 'GreaterThan', 'GreaterEquals')]
        [System.String]
        $Operator,

        [Parameter(Mandatory = $true)]
        [System.String]
        $Value
    )
    begin
    {
    }

    process
    {
        $BundleRequirement = New-Object FileVersionRequirement
        $BundleRequirement.FileName = $FileName
        $BundleRequirement.Operator = $Operator
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
