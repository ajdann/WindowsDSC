Enable-PSRemoting -Force
# Import-DscResource -ModuleName 'PSDesiredStateConfiguration'
# Set-Item WSMan:\localhost\Client\TrustedHosts -Value "localhost" -Force
# winrm set winrm/config/client '@{TrustedHosts="localhost"}'


# Import shared variables
. ".\Shared\Variables.ps1"


. Modules\VSCode\DownloadVSCode.ps1
. Modules\VSCode\InstallVSCode.ps1
. .\Modules\Git\Git.ps1
