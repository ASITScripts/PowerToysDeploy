$InstallationFolderPath = 'C:\ASITScripts'
$DeployAppInstaller = 'https://github.com/microsoft/PowerToys/releases/download/v0.67.1/PowerToysSetup-0.67.1-arm64.exe'

New-Item -Path $InstallationFolderPath  -ItemType directory
New-Item -Path $InstallationFolderPath\AppInstaller  -ItemType directory

Write-Host -ForegroundColor Green 'Starting download for App Installer'
$outFile = "$InstallationFolderPath\AppInstaller\PowerToysSetup-0.67.1-arm64.exe"
Start-BitsTransfer -Source $DeployAppInstaller -Destination $outFile
Unblock-File -Path "$InstallationFolderPath\AppInstaller\PowerToysSetup-0.67.1-arm64.exe"

Start-Process -Wait -FilePath "$InstallationFolderPath\AppInstaller\PowerToysSetup-0.67.1-arm64.exe" -argumentlist '-silent','-no_full_ui'
Write-Host -ForegroundColor Green 'Completed'