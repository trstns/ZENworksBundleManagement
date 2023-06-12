function Test-RunningAsAdmin
{
    $RunningAsAdmin = ([Security.Principal.WindowsPrincipal] `
        [Security.Principal.WindowsIdentity]::GetCurrent() `
            ).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

    Return $RunningAsAdmin
}
