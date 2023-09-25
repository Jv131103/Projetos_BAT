@echo off

REM Obter hora e data atuais
for /f "tokens=1-2 delims=/ " %%a in ("%DATE%") do (
    set "dia=%%a"
    set "mes=%%b"
)
for /f "tokens=1-3 delims=: " %%a in ("%TIME%") do (
    set "hora=%%a"
    set "minuto=%%b"
    set "segundo=%%c"
)

REM Exibir a hora e a data atuais
echo Data atual: %dia%/%mes%
echo Hora atual: %hora%:%minuto%:%segundo%

REM Abrir o VirtualBox
echo Listando VMs disponíveis do VirtualBox:
"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms
for /f "tokens=1" %%i in ('"C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" list vms') do (
    echo Iniciando a VM: %%i
    "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe" startvm "%%i"
)

REM Tempo de espera antes de fechar o prompt de comando
timeout /t 10

REM Impede o prompt de comando de fechar imediatamente
pause >nul
