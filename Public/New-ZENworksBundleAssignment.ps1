$script:ZENworksBundleIconLocationXML = @"
<ApplicationLocationData>
    <Desktop>{0}</Desktop>
    <StartMenu>{1}</StartMenu>
    <SystemTray>{2}</SystemTray>
    <TaskBar>{3}</TaskBar>
    <StartmenuTiles>{4}</StartmenuTiles>	
    <QuickLaunch>{5}</QuickLaunch>
    <ZENworksWindow>{6}</ZENworksWindow>
</ApplicationLocationData>
"@

function New-ZENworksBundleAssignment
{

    <#
    .SYNOPSIS
        Assigns a bundle to a device or devices
    .PARAMETER BundleName
        The name of the bundle to assign.
    .PARAMETER BundlePath
        The path where the bundle resides.
    .PARAMETER DevicePath
        The path of the device, device folder or device group that you would like to assign the bundle to.
    .PARAMETER InstallOnRefresh
        Specifies whether to install this bundle when a device is refreshed.
        It is strongly advised that you set requirements on the bundle so that it is only applicable if the bundle hasn't been installed yet.
    .PARAMETER DesktopIcon
        Place an icon for this bundle on the desktop.
    .PARAMETER StartMenuIcon
        Place an icon for this bundle on the Start Menu.
    .PARAMETER SystemTrayIcon
        Place an icon for this bundle on the SystemTray.
    .PARAMETER TaskBarIcon
        Place an icon for this bundle on the Task Bar.
    .PARAMETER StartmenuTilesIcon
        Place an icon for this bundle as a Start menu Tile.
    .PARAMETER QuickLaunchIcon
        Place an icon for this bundle on the Quick Launch menu.
    .PARAMETER ZENworksWindowIcon
        Place an icon for this bundle in the ZENworks Window.
    .PARAMETER Credentials
        ZENworks administrator credentials to be able to perform this action.
    .EXAMPLE
        PS C:\>New-ZENworksBundleAssignment -BundleName "Test Bundle" -BundlePath "Installs" -DevicePath "/Devices/Workstations" -ZENworksWindowIcon -Credential $Credential

        This example will assign the bundle 'Test Bundle' in the Installs folder to all workstations and place an icon in the ZENworks window.
    .EXAMPLE
        PS C:\>New-ZENworksBundleAssignment -BundleName "Test Bundle" -BundlePath "Installs" -DevicePath "/Devices/Workstations" -InstallOnRefresh -Credential $Credential
        
        This example will assign the bundle 'Test Bundle' in the Installs folder to all workstations and install it when the devices next refresh.
        No icons will be visible to the user.

    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [String]$BundleName,

        [Parameter(Mandatory = $true)]
        [String]$BundlePath,

        [Parameter(Mandatory = $true)]
        [String]$DevicePath,

        [Switch]$InstallOnRefresh,
        [Switch]$DesktopIcon,
        [Switch]$StartMenuIcon,
        [Switch]$SystemTrayIcon,
        [Switch]$TaskBarIcon,
        [Switch]$StartmenuTilesIcon,
        [Switch]$QuickLaunchIcon,
        [Switch]$ZENworksWindowIcon,

        [Parameter(Mandatory = $true)]
        [PSCredential]
        $Credential
    )
    begin
    {
        # Remove leading slashes and 'Bundles' from the bundle path
        $CleanBundlePath = $BundlePath -Replace "^[\/]?(Bundles)?[\/]?","" 
        $CleanDevicePath = $DevicePath -Replace "^[\/]?(Devices)?[\/]?","" 
        # Create properly formatted bundle path
        $FullBundlePath = "/Bundles/{0}/{1}" -f $CleanBundlePath,$BundleName
        $FullDevicePath = "/Devices/{0}" -f $CleanDevicePath
    }
    process
    {
        $BundleIconLocationXmlFile = Join-Path $Env:TEMP "$(Get-Random).xml"
        $BundleIconLocationXml = $script:ZENworksBundleIconLocationXML -f $DesktopIcon.IsPresent.ToString().ToLower(), $StartMenuIcon.IsPresent.ToString().ToLower(), $SystemTrayIcon.IsPresent.ToString().ToLower(), $TaskBarIcon.IsPresent.ToString().ToLower(), $StartmenuTilesIcon.IsPresent.ToString().ToLower(), $QuickLaunchIcon.IsPresent.ToString().ToLower(), $ZENworksWindowIcon.IsPresent.ToString().ToLower()
        Set-Content -Path $BundleIconLocationXmlFile -Value $BundleIconLocationXml

        $ZMANParams = "device", """$FullBundlePath""", """$FullDevicePath""", "--icon-location=""$BundleIconLocationXmlFile"""
        if ($InstallOnRefresh.IsPresent) {
            $ZMANParams += "--distribute-on-device-refresh", "--install-immediately"
        }

        Write-Verbose "Launching ZMAN with params: $ZMANParams"
        $ZMANresult = Invoke-ZMAN -Command "bundle-assign" -CommandOptions $ZMANParams -ZenCredential $Credential

        return $ZMANresult  
    }
}
