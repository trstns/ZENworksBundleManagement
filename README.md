# ZENworksBundleManagement
A module to create and assign ZENworks bundles.  

This module relies on the [ZenworksZMAN](https://www.powershellgallery.com/packages/ZenworksZMAN/) module which simplifies running ZMAN commands in PowerShell.

## How to use 
Drop the root folder in your PSModulePath, remove the branch name (ex. main )from the folder, and PowerShell should find the module.

## Functions
* **New-ZENworksBundle** Create a new ZENworks bundle
* **New-ZENworksBundleAssignment** Assign a bundle to a device or devices
* **New-ZENworksBundleRequirements** Create a bundle requirements object containing groups or requirement filters.
* **New-ZENworksBundleRequirementsFilter** Create a requirement filter.
* **New-ZENworksBundleRequirementsGroup** Create a group of requirement filters.
* **New-ZENworksBundleFileRemovalAction** Create an action to remove files on target devices.
* **New-ZENworksBundleInstallBundleAction** Create an action to install a bundle on target devices.
* **New-ZENworksBundleInstallExecutableAction** Create an action to install an executable on target devices.
* **New-ZENworksBundleInstallFilesAction** Create an action to install an file or files on target devices.
* **New-ZENworksBundleInstallMSIAction** Create an action to install an MSI on target devices.
* **New-ZENworksBundleLaunchAction** Create an action to launch an executable on target devices.
* **New-ZENworksBundleRegistryEditAction** Create an action to create or update registry values on target devices.
* **New-ZENworksBundleServiceAction** Create an action to start or stop a service on target devices.
* **New-ZENworksBundleStopProcessAction** Create an action to stop a running process on target devices.
* **Remove-ZENworksBundleAction** Remove one or more bundle actions from an existing bundle.


### New-ZENworksBundle
* **Name** The name of the bundle.
* **Path** The path where the bundle should be created.
* **Description** A description for the bundle.
* **AdminNotes** Admin notes
* **Requirements** Requirements for the bundle to be applied to the device.
* **Actions** Actions for the bundle to perform.
* **Credential** Credentials to authenticate with ZENworks as an administrator.

### New-ZENworksBundleAssignment
* **BundleName**: The name of the bundle we are assigning to devices.
* **BundlePath**: The path of the bundle.
* **DevicePath**: The path for the device(s) we are assigning to.
* **InstallOnRefresh**: Should the bundle install on device refresh?
* **DesktopIcon**: Create a desktop icon?
* **StartMenuIcon**: Create a start menu icon?
* **SystemTrayIcon**: Create a system tray icon?
* **TaskBarIcon**: Create a taskbar icon?
* **StartmenuTilesIcon**: Create a start menu tiles icon?
* **QuickLaunchIcon**: Create a quick launch icon?
* **ZENworksWindowIcon**: Create a ZENworks window icon?
* **Credential**: Credentials to authenticate with ZENworks as an administrator.

### New-ZENworksBundleRequirements
* **Conjunction** The conjunction to apply to the groups. Defaults to OR.
* **Groups** Groups of requirement filters created with New-ZENworksBundleRequirementsGroup.

### New-ZENworksBundleRequirementsFilter
* **Type** The type of filter to use.  Currently supports 'ArchitectureReq', 'RegValueReq', 'ProcessRunningReq', 'FileExistsReq'
* **Operator** The operator to use for comparison.  Valid options are 'Equals'. Only required when type is 'ArchitectureReq' or 'RegValueReq'.
* **Value** The value to compare against.
* **Name** The name of the object to compare. Only required when type is 'RegValueReq', 'ProcessRunningReq' or 'FileExistsReq'
* **RegistryKeyName** The registry key name where 'name' is located.  Only required when type is 'RegValueReq'.

### New-ZENworksBundleRequirementsGroup
* **Conjunction** The conjunction to use between the groups.  Defaults to AND.
* **Filters** Array of requirement filters created using New-ZENworksBundleRequirementsFilter.

### New-ZENworksBundleFileRemovalAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **Files** An array of files (including full path) that should be removed from the target computer.

### New-ZENworksBundleInstallBundleAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **BundlePath** The name (including path) of the bundle to install.

### New-ZENworksBundleInstallExecutableAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **FileName** The full path of the file which will be imported into ZCM.
* **Impersonate** Which user should be used to execute this file.  Valid options are 'SYSTEM' and 'USER'.  Defaults to 'SYSTEM'.
* **WaitForExit** Should ZENworks wait for the process to exit before continuing? Defaults to true.
* **CommandLineParameters** Command line parameters to pass to the executable.
* **SuccessReturnCodes** Return codes that indicate the file executed successfully.
* **IncludeAllFilesinFolder** When importing the executable into ZENworks, also import all files in the same folder. Defaults to false.
* **IncludeAllFilesinSubFolders** When importing the executable into ZENworks, also import all files in subfolders next to the executable. Defaults to false.

### New-ZENworksBundleInstallFilesAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **FileName** The full path of the file which will be imported into ZCM.
* **IncludeAllFilesinFolder** When importing the executable into ZENworks, also import all files in the same folder. Defaults to false.
* **IncludeAllFilesinSubFolders** When importing the executable into ZENworks, also import all files in subfolders next to the executable. Defaults to false.
* **DestinationDirectory** The directory in which to place the file(s) on the target computer.
* **DestinationFileName** The filename for the file on the target computer.
* **CopyOption** Specify when file(s) should be copied. Valid values are 'CopyAlways','CopyIfExists','CopyIfDoesNotExist','CopyIfNewer','CopyIfNewerAndExists','CopyIfNewerVersion' and 'CopyIfDifferent'. Defaults to 'CopyAlways'.

### New-ZENworksBundleInstallMSIAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **FileName** The full path of the file which will be imported into ZCM.
* **InstallParameters** Parameters to pass to the installer.
* **IncludeAllFilesinFolder** When importing the executable into ZENworks, also import all files in the same folder. Defaults to false.
* **IncludeAllFilesinSubFolders** When importing the executable into ZENworks, also import all files in subfolders next to the executable. Defaults to false.

### New-ZENworksBundleLaunchAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **Command** The command to run on the target computer.
* **Impersonate** Which user should be used to execute this file.  Valid options are 'SYSTEM' and 'USER'.  Defaults to 'SYSTEM'.
* **WaitForExit** Should ZENworks wait for the process to exit before continuing? Defaults to true.
* **CommandLineParameters** Command line parameters to pass to the executable.
* **WorkingDirectory** The working directory when launching the file.
* **SuccessReturnCodes** Return codes that indicate the file executed successfully.

### New-ZENworksBundleRegistryEditAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **RegistryEntries** An array of registry values to create or modify.
* **HKCUOption** Specify whether values in the HKCU hive should be written to the Default User or the Current user. Valid values are 'DefaultUser' and 'CurrentUser'.  Defaults to 'DefaultUser'.

### New-ZENworksBundleServiceAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **ServiceName** The name of the service to start or stop.
* **Action** The action to perform on the service. Valid values are 'Start' and 'Stop'.

### New-ZENworksBundleStopProcessAction
* **Name** The name of the action.
* **Section** The section to place this action.  Valid options are 'Install' or 'Launch'.
* **ContinueOnFailure** Should subsequent actions be executed if this action fails? Defaults to false.
* **ProcessName** The name of the process to stop.

### Remove-ZENworksBundleAction
* **BundleName**: The name of the bundle we are assigning to devices.
* **BundlePath**: The path of the bundle.
* **ActionSet**: The action set containing the action(s) to remove.
* **ActionPositions**: The positions of the action(s) to remove.
* **Credential**: Credentials to authenticate with ZENworks as an administrator.

## Examples

### Create a new bundle to install an MSI file on 64bit windows
```PowerShell
New-ZENworksBundle -Credential $ZenCredentials -Name "Install Application" -Path "Installs" -Requirements (
    New-ZENworksBundleRequirements -Groups (
        (New-ZENworksBundleRequirementsGroup -Filters (
            (New-ZENworksBundleRequirementsFilter -Type 'ArchitectureReq' -Operator 'Equals' -Value '64')
        ))
    )
) -Actions (
    (New-ZENworksBundleInstallMSIAction -Name "Install Application MSI" -Section "Install" -FileName "C:\Application.msi")
)
```