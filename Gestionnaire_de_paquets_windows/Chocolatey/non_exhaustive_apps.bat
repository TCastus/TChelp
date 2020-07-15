@echo off

set /P IDE="Choisie si tu veux installer vscode ou la suite JetBrains"

IF "%IDE%" == "vscode" (
	choco install vscode -y
) ELSE IF "%IDE%" == "vscode" (
	choco install clion-ide -y
	choco install pycharm-community -y
	choco install intellijidea-community -y
	choco install goland -y
	choco install webstorm -y
) ELSE (
	set /P IDE="Saisie invalid, taper vscode ou jetbrains"
)

choco install openconnect-gui -y
choco install python -y
choco install pip -y
choco install golang -y
choco install nodejs -y
choco install gns3 -y
choco install wireshark -y
choco install jdk11 -y
choco install gcc-arm -y
choco install haskell-dev -y

pause
