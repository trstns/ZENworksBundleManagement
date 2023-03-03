<#
    .SYNOPSIS
        Create a bundle requirement to check if file or folder exists.
    .PARAMETER Name
        The full path of the file or folder.
    .PARAMETER Value
        Valid values are 'true' and 'false'
    .EXAMPLE
        PS C:\>New-ZENworksBundleFileExistsRequirement -Name "C:\Windows\notepad.exe" -Value "true"

        Create a bundle requirement that checks that C:\Windows\notepad.exe exists.
#>

class FileExistsRequirement {
    [string]$Type = 'FileExistsReq'
    [string]$Name
    [string]$Value
}

function New-ZENworksBundleFileExistsRequirement
{
    [OutputType([void])]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $FileName,

        [Parameter(Mandatory = $true)]
        [ValidateSet('true', 'false')]
        [System.String]
        $Value
    )
    begin
    {
    }

    process
    {
        $BundleRequirement = New-Object FileExistsRequirement
        $BundleRequirement.Name = $FileName
        $BundleRequirement.Value = $Value

        return $BundleRequirement
    }
}
