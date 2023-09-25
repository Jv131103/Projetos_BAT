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

REM Abrir o VMware Player
echo Iniciando o VMware Player...
start "" "vmplayer.exe"

REM Tempo de espera para que o VMware Player seja iniciado
timeout /t 5

REM Iniciar as máquinas virtuais
echo Iniciando as máquinas virtuais...

REM Pasta contendo as máquinas virtuais
set "pastaVM=C:\Users\user\Documents\Virtual Machines"

REM Iterar sobre os diretórios na pasta
for /d %%i in ("%pastaVM%\*") do (
    echo Iniciando a máquina virtual: %%~nxi
    start "" "vmplayer.exe" "%%i\%%~nxi.vmx"
)

REM Tempo de espera antes de fechar o prompt de comando
timeout /t 10

REM Impede o prompt de comando de fechar imediatamente
pause >nul
