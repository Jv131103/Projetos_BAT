@echo off

echo "Iniciando as VMS"

set "vboxmanage=C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

for /f "tokens=*" %%i in ('"%vboxmanage% list vms"') do (
    set vm=%%i
    echo Iniciando a máquina virtual: !vm!
    "%vboxmanage%" startvm !vm! --type headless
)

echo Todas as máquinas virtuais foram iniciadas.
pause
