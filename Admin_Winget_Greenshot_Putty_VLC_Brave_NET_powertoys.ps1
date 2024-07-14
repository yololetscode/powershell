# Create an array with all the installation commands
$commands = @(
    "winget install Microsoft.DotNet.Runtime.7 -s winget -h",
    "winget install VLC -s winget -h",
    "winget install Greenshot -s winget -h",
    "winget install Putty -s winget -h",
    "winget install 7zip -s winget -h",
    "winget install Brave.Brave -s winget -h",
    "winget install powertoys -s winget -h",
    "winget install Microsoft.VisualStudioCode -s winget -h",
    "winget install  Python.Python.3.8 -s winget -h",
    "winget install GIMP.GIMP -s winget -h"
    "winget install CPUID.CPU-Z -s winget -h"
    "winget install GeekUninstaller.GeekUninstaller -s winget -h"		
)

# Initialize log file
$logFile = "install_log.txt"
if (Test-Path $logFile) {
    Clear-Content $logFile
}

# Loop through the array and execute each command
foreach ($command in $commands) {
    # Execute the command and wait for it to complete
    Start-Process -NoNewWindow -Wait -FilePath PowerShell -ArgumentList "-Command & {$command}"
    
    # Check if the last command was successful
    if ($LASTEXITCODE -eq 0) {
        # Write success to the log file
        Add-Content -Path $logFile -Value "$command: SUCCESS"
    } else {
        # Write failure to the log file
        Add-Content -Path $logFile -Value "$command: FAILURE"
    }
}
