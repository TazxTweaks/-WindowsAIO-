@echo off
title WindowsAIO V.1
::VISUAL
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f 
color 03
chcp 65001 >nul 2>&1
cls
echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
::Aviso importante y descargo de responsabilidad.
echo Este ¨.bat¨ esta hecho para llegar aplicar algunos ajustes en tu windows con el objetivo de mejorar el rendimiento,
echo esto no se significa que el rendimiento suba de 100 FPS a 300 FPS, este script busca estabilizar y mejorar FPS considerablemente.
echo ¨Tazx no se hace cargo si tienes algun problema con este script¨
echo Si encuentras un error me gustaria que me lo dejes a saber por un mensaje a DM en X./ Recomiendo crear un Punto de restauracion.
pause
cls
:menu
cls
echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
                                               
echo				[1] Crear un Punto De restauracion.                   [2]  Saltar  
set /p choice=
if '%choice%'=='1' goto si
if '%choice%'=='2' goto no
if not "%choice%"=="1" goto error if not "%choice%"=="2" goto error

:error
echo Opcion no valida.
timeout /t 5 /nobreak >nul 
goto menu

:si
cls

echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
:: EMPIEZA
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f 
powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'AIO-ANTES'
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\NetBT" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\fhsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MSDeploy\3" /v "EnableTelemetry" /t REG_DWORD /d 1 /f
DEL /F /S /Q "%SystemRoot%\Temp\*.*"
DEL /F /S /Q "%SystemRoot%\Prefetch\*.*"
DEL /F /S /Q "%USERPROFILE%\AppData\Local\Temp\*.*"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
wevtutil cl Application
wevtutil cl Security
wevtutil cl System
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
netsh int tcp set global autotuninglevel=disabled
:: Instalando DevManView.exe... 
curl -g -k -L -# -o "C:\Windows\System32\DevManView.exe" "https://github.com/TazxTweaks/TazxPerfomance/raw/refs/heads/main/Bios/DevManView.exe"
DevManView.exe /disable "High Precision Event Timer"
DevManView.exe /disable "Microsoft GS Wavetable Synth"
DevManView.exe /disable "Microsoft RRAS Root Enumerator"
DevManView.exe /disable "Intel Management Engine"
DevManView.exe /disable "Intel Management Engine Interface"
DevManView.exe /disable "Intel SMBus"
DevManView.exe /disable "SM Bus Controller"
DevManView.exe /disable "Amdlog"
DevManView.exe /disable "AMD PSP"
DevManView.exe /disable "System Speaker"
DevManView.exe /disable "Composite Bus Enumerator"
DevManView.exe /disable "Microsoft Virtual Drive Enumerator"
DevManView.exe /disable "Microsoft Hyper-V Virtualization Infrastructure Driver"
DevManView.exe /disable "NDIS Virtual Network Adapter Enumerator"
DevManView.exe /disable "Remote Desktop Device Redirector Bus"
DevManView.exe /disable "UMBus Root Bus Enumerator"
DevManView.exe /disable "WAN Miniport (IP)"
DevManView.exe /disable "WAN Miniport (IKEv2)"
DevManView.exe /disable "WAN Miniport (IPv6)"
DevManView.exe /disable "WAN Miniport (L2TP)"
DevManView.exe /disable "WAN Miniport (PPPOE)"
DevManView.exe /disable "WAN Miniport (PPTP)"
DevManView.exe /disable "WAN Miniport (SSTP)"
DevManView.exe /disable "WAN Miniport (Network Monitor)"
DevManView.exe /disable "System Speaker"
DevManView.exe /disable "System Timer"
DevManView.exe /disable "High precision event timer"
DevManView.exe /disable "WAN Miniport (IKEv2)"
DevManView.exe /disable "WAN Miniport (IP)"
DevManView.exe /disable "WAN Miniport (IPv6)"
DevManView.exe /disable "WAN Miniport (L2TP)"
DevManView.exe /disable "WAN Miniport (Network Monitor)"
DevManView.exe /disable "WAN Miniport (PPPOE)"
DevManView.exe /disable "WAN Miniport (PPTP)"
DevManView.exe /disable "WAN Miniport (SSTP)"
DevManView.exe /disable "Direct memory access controller"
DevManView.exe /disable "System CMOS/real time clock"
DevManView.exe /disable "Unknown device"
DevManView.exe /disable "Microsoft Virtual Drive Enumerator"
DevManView.exe /disable "UMBus Root Bus Enumerator"
DevManView.exe /disable "Programmable Interrupt Controller"
DevManView.exe /disable "Composite Bus Enumerator"
DevManView.exe /disable "Numeric Data Processor"
DevManView.exe /disable "Legacy Device"
DevManView.exe /disable "PCI Memory Controller"
DevManView.exe /disable "PCI Simple Communications Controller"
DevManView.exe /disable "SM Bus Controller"
DevManView.exe /disable "PCI Data Acquisition and Signal Processing Controller"
DevManView.exe /disable "Base System Device"
Start https://x.com/TazxTweaks
cls

echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
echo Porfavor Reinicia tu PC para que se apliquen los cambios
timeout /t 5 /nobreak >nul
exit

:no
cls

echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
:: EMPIEZA-sin Punto de restauracion.
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\services\NetBT" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" /v "DisableDiagnosticTracing" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\fhsvc" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v "value" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MSDeploy\3" /v "EnableTelemetry" /t REG_DWORD /d 1 /f
DEL /F /S /Q "%SystemRoot%\Temp\*.*"
DEL /F /S /Q "%SystemRoot%\Prefetch\*.*"
DEL /F /S /Q "%USERPROFILE%\AppData\Local\Temp\*.*"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
wevtutil cl Application
wevtutil cl Security
wevtutil cl System
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
netsh int tcp set global autotuninglevel=disabled
:: Instalando DevManView.exe... 
curl -g -k -L -# -o "C:\Windows\System32\DevManView.exe" "https://github.com/TazxTweaks/TazxPerfomance/raw/refs/heads/main/Bios/DevManView.exe"
DevManView.exe /disable "High Precision Event Timer"
DevManView.exe /disable "Microsoft GS Wavetable Synth"
DevManView.exe /disable "Microsoft RRAS Root Enumerator"
DevManView.exe /disable "Intel Management Engine"
DevManView.exe /disable "Intel Management Engine Interface"
DevManView.exe /disable "Intel SMBus"
DevManView.exe /disable "SM Bus Controller"
DevManView.exe /disable "Amdlog"
DevManView.exe /disable "AMD PSP"
DevManView.exe /disable "System Speaker"
DevManView.exe /disable "Composite Bus Enumerator"
DevManView.exe /disable "Microsoft Virtual Drive Enumerator"
DevManView.exe /disable "Microsoft Hyper-V Virtualization Infrastructure Driver"
DevManView.exe /disable "NDIS Virtual Network Adapter Enumerator"
DevManView.exe /disable "Remote Desktop Device Redirector Bus"
DevManView.exe /disable "UMBus Root Bus Enumerator"
DevManView.exe /disable "WAN Miniport (IP)"
DevManView.exe /disable "WAN Miniport (IKEv2)"
DevManView.exe /disable "WAN Miniport (IPv6)"
DevManView.exe /disable "WAN Miniport (L2TP)"
DevManView.exe /disable "WAN Miniport (PPPOE)"
DevManView.exe /disable "WAN Miniport (PPTP)"
DevManView.exe /disable "WAN Miniport (SSTP)"
DevManView.exe /disable "WAN Miniport (Network Monitor)"
DevManView.exe /disable "System Speaker"
DevManView.exe /disable "System Timer"
DevManView.exe /disable "High precision event timer"
DevManView.exe /disable "WAN Miniport (IKEv2)"
DevManView.exe /disable "WAN Miniport (IP)"
DevManView.exe /disable "WAN Miniport (IPv6)"
DevManView.exe /disable "WAN Miniport (L2TP)"
DevManView.exe /disable "WAN Miniport (Network Monitor)"
DevManView.exe /disable "WAN Miniport (PPPOE)"
DevManView.exe /disable "WAN Miniport (PPTP)"
DevManView.exe /disable "WAN Miniport (SSTP)"
DevManView.exe /disable "Direct memory access controller"
DevManView.exe /disable "System CMOS/real time clock"
DevManView.exe /disable "Unknown device"
DevManView.exe /disable "Microsoft Virtual Drive Enumerator"
DevManView.exe /disable "UMBus Root Bus Enumerator"
DevManView.exe /disable "Programmable Interrupt Controller"
DevManView.exe /disable "Composite Bus Enumerator"
DevManView.exe /disable "Numeric Data Processor"
DevManView.exe /disable "Legacy Device"
DevManView.exe /disable "PCI Memory Controller"
DevManView.exe /disable "PCI Simple Communications Controller"
DevManView.exe /disable "SM Bus Controller"
DevManView.exe /disable "PCI Data Acquisition and Signal Processing Controller"
DevManView.exe /disable "Base System Device"
Start https://x.com/TazxTweaks
cls

echo -----------------------------------------------------------------------------------------------------------------------
echo                                                       █████  ██  ██████  
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ███████ ██ ██    ██ 
echo                                                      ██   ██ ██ ██    ██ 
echo                                                      ██   ██ ██  ██████  
echo -----------------------------------------------------------------------------------------------------------------------
echo Porfavor Reinicia tu PC para que se apliquen los cambios
timeout /t 5 /nobreak >nul
exit