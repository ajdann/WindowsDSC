Configuration InstallVSCode {

  Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node localhost {

        Script VSCode {
            GetScript = {
                Write-Output "Checking if the vscode is installed."
                return @{ Result = if ([bool](Get-Command -Name "code" -ErrorAction SilentlyContinue)) { "True" } else { "False" }}
            }
            TestScript = {
                Write-Host "Check if vscode is installed"      
                return [bool](Get-Command -Name "code" -ErrorAction SilentlyContinue)
            }
            SetScript = {
                Write-Host "Installing the VSCode"
                Start-Process -FilePath "C:\Users\USER\Downloads\VSCodeSetup.exe" -ArgumentList "/verysilent /norestart" -Wait
            }
            #TODO: Understand how to have a proper dependency on another scripts
            # DependsOn = "[Script]DownloadVSCode"
        }
    }
}

InstallVSCode
Start-DscConfiguration -Path "InstallVSCode" -Wait -Force -Verbose