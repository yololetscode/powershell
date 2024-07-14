# Function to check if winget is installed
function Is-WingetInstalled {
    try {
        & winget --info >$null 2>&1
        return $true
    }
    catch {
        return $false
    }
}

# Check if winget is installed
if (Is-WingetInstalled) {
    Write-Output "Winget is already installed."
} else {
    Write-Output "Winget is not installed. Attempting to install..."

    # Define the download URL and output path
    $installerUrl = "https://github.com/microsoft/winget-cli/releases/download/v1.5.1881/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
    $outputPath = "$env:TEMP\Microsoft.DesktopAppInstaller.msixbundle"

    # Download the installer
    Invoke-WebRequest -Uri $installerUrl -OutFile $outputPath

    # Install the package
    Add-AppxPackage -Path $outputPath

    # Clean up the downloaded installer
    Remove-Item -Path $outputPath

    # Verify the installation
    if (Is-WingetInstalled) {
        Write-Output "Winget has been successfully installed."
    } else {
        Write-Output "Failed to install Winget. Please try manual installation."
    }
}
