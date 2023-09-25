@echo off

echo "==========================================================================="
echo "|				Bem vindo ao BACKUP!				|"
echo "==========================================================================="
set /p pasta_inicio="Escreva o diretório que vai realizar o backup! "
set /p pasta_destino="Escreva o diretório que vai armazenar o backup! "
echo "Verificando..."
timeout 5
echo "Realizando o Backup"
robocopy "%pasta_inicio%" "%pasta_destino%" /S /E
echo "FIM!"
echo "Obrigado por usar o sistema de backup"
echo "==========================================================================="
pause