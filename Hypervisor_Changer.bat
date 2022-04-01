# Hypervisor_Changer é um script em .bat, usado para habilitar e desabilitar o serviço de hypervisorlaunchtype.
# Quando em "auto" o docker funcionará e o VMWare não por incompatibilidade.
# Quando em "off" o Docker não funcionará e o VMWare volta a funcionar normalmente.
# Desenvolvido por Andrei F. Cesmegi na Clover IT.

@echo off
cls
:start
bcdedit /enum {current}
ECHO.
ECHO 1. Habilita o Hypervisor - Docker
ECHO 2. Desliga o Hypervisor - VMWare
ECHO.
set choice=
set /p choice=Escolha o comando desejado abaixo:
if '%choice%'=='1' goto Command1
if '%choice%'=='2' goto Command2
:Command1
cmd.exe /c bcdedit /set hypervisorlaunchtype auto
goto finish
:Command2
cmd.exe /c bcdedit /set hypervisorlaunchtype off
goto finish
:finish
shutdown.exe /r /t 00
exit
