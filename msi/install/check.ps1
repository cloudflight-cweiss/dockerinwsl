Set-StrictMode -Version 3

. "$PSScriptRoot\_common.ps1"

Add-Type -AssemblyName Microsoft.VisualBasic
if(((wsl --help) | Measure-Object).Count -lt 150){
    [Microsoft.VisualBasic.Interaction]::MsgBox("WSL2 not installed!`n`nTry running 'wsl --install' in an elevated shell, reboot and start this install again.", 'OKOnly,SystemModal,Critical', "DockerInWSL Installation Error") | Out-Null
    throw "WSL2 not installed"
}

if ((Get-WmiObject Win32_Product | Where-Object { $_.Name -match 'Windows Subsystem for Linux Update' } | Measure-Object).Count -le 0) {
    [Microsoft.VisualBasic.Interaction]::MsgBox("No 'Windows Subsystem for Linux Update' found!`nPlease visit https://docs.microsoft.com/en-us/windows/wsl/install-manual and install the update if this installation fails.") | Out-Null
}
