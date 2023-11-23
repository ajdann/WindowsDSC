Enable-PSRemoting -Force
Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
# Set-Item WSMan:\localhost\Client\TrustedHosts -Value "localhost" -Force
# winrm set winrm/config/client '@{TrustedHosts="localhost"}'
./tutorial/HelloWorld.ps1
./tutorial/DownloadVSCode.ps1
./tutorial/VSCode.ps1