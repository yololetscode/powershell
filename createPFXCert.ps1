param (
    [string]$password,
    [string]$cerPath,
    [string]$pfxOutputPath
)

# Convert plain text password to a secure string
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force

# Load the .cer file
$cert = Get-PfxCertificate -FilePath $cerPath

# Export the certificate as .pfx
$pfxContent = Export-PfxCertificate -Cert $cert -Password $securePassword -FilePath $pfxOutputPath -Force

Write-Host "PFX certificate created at: $pfxOutputPath"


## Parameter call example:      \CreatePfxFromCer.ps1 -password "your_password" -cerPath "C:\path\to\certificate.cer" -pfxOutputPath "C:\path\to\output.pfx" 
