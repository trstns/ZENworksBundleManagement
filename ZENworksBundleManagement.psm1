
# Import everything in these folders
#foreach($folder in @('private', 'public', 'classes'))
foreach($folder in @('private', 'public'))
{    
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if(Test-Path -Path $root)
    {
        Write-Output "processing folder $root"
        $files = Get-ChildItem -Path $root -Filter *.ps1 -Recurse

        # dot source each file
        $files | where-Object { $PSItem.name -NotLike '*.Tests.ps1'} | 
            ForEach-Object{Write-Verbose $PSItem.name; . $PSItem.FullName}
    }
}

Export-ModuleMember -function (Get-ChildItem -Recurse -Path "$PSScriptRoot\public" -Include *.ps1).basename
#Export-ModuleMember -function (Get-ChildItem -Recurse -Path "$PSScriptRoot\private" -Include *.ps1).basename
