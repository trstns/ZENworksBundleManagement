## Versions


## 0.1.0.1

*    Changed how bundle requirement filters are created - using separate functions.
*    Added XML helper function to simplify XML node creation and improve readability of code.
*    Separated XML generation code into separate functions and updated to use new XML helper.
*    Replaced 'Section' parameters with 'ActionSet' to match ZENworks documentation.
*    Fixed a bug which caused the ActionContentInfo XML to be generated incorrectly.
*    Added the following functions:
     * New-ZENworksBundleArchitectureRequirement
     * New-ZENworksBundleFileExistsRequirement
     * New-ZENworksBundleProcessRunningRequirement
     * New-ZENworksBundleRegistryKeyExistsRequirement
     * New-ZENworksBundleRegistryKeyValueExistsRequirement
     * New-ZENworksBundleRegistryKeyValueRequirement
     * New-ZENworksBundleServiceExistsRequirement
     * New-ZENworksBundleServiceRunningRequirement
*    Removed the following function
     * New-ZENworksBundleRequirementsFilter


## 0.1.0.0
*    Initial release with the following functions
     * Assign-ZENworksBundle
     * New-ZENworksBundle
     * New-ZENworksBundleRequirements
     * New-ZENworksBundleRequirementsFilter
     * New-ZENworksBundleRequirementsGroup
     * New-ZENworksBundleFileRemovalAction
     * New-ZENworksBundleInstallBundleAction
     * New-ZENworksBundleInstallExecutableAction
     * New-ZENworksBundleInstallFilesAction
     * New-ZENworksBundleInstallMSIAction
     * New-ZENworksBundleLaunchAction
     * New-ZENworksBundleRegistryEditAction
     * New-ZENworksBundleServiceAction
     * New-ZENworksBundleStopProcessAction