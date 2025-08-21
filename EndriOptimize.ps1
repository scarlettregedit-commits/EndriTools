# EndriOptimize.ps1
Write-Host "🧠 Panel de Optimización - Endri Tools" -ForegroundColor Cyan

function Opti-Sencilla {
    Write-Host "🔹 Ejecutando optimización sencilla..."
    Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Stop-Process -Name "OneDrive" -Force -ErrorAction SilentlyContinue
}

function Opti-Media {
    Write-Host "🔸 Ejecutando optimización media..."
    Opti-Sencilla
    Stop-Service -Name "SysMain" -Force -ErrorAction SilentlyContinue
    Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0"
}

function Opti-Full {
    Write-Host "🔴 Ejecutando optimización FULL..."
    Opti-Media
    powercfg -setactive SCHEME_MAX
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0
}

Write-Host "`nSelecciona nivel de optimización:"
Write-Host "1. Sencilla"
Write-Host "2. Media"
Write-Host "3. Full"
$choice = Read-Host "Opción (1-3)"

switch ($choice) {
    "1" { Opti-Sencilla }
    "2" { Opti-Media }
    "3" { Opti-Full }
    default { Write-Host "❌ Opción inválida." }
}
