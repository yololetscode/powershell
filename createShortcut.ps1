$Url = "https://login.greenwaysecurecloud.com"
$publicDesktopPath = "${env:Public}\Desktop"

if(!(test-path "$publicDesktopPath\Greenway Login.lnk")) {
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$publicDesktopPath\Greenway Login.lnk")
$Shortcut.TargetPath = $Url
$Shortcut.IconLocation = "%SystemRoot%\system32\imageres.dll,20"
$Shortcut.Save()
} 

else {
Write-Error "Path Already exists. Did not create shortcut."

}
