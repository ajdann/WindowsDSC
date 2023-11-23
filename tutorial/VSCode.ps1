Configuration VSCode {

  Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node localhost {
        Script VSCode {
            GetScript = {
                Write-Output "Checking if the vscode is already installed."
                $vscodeInstalled = Get-Command code -ErrorAction SilentlyContinue
                return @{ Result = if ($vscodeInstalled) { "True" } else { "False" }}
            }
            TestScript = {
                Write-Host "Running the test script for vscode"
                # Check if VSCode is already installed
                $vscodeInstalled = Get-Command code -ErrorAction SilentlyContinue
                return -not $vscodeInstalled
            }
            SetScript = {
                $vscodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64"               
                $downloadPath = "~\Downloads\VSCodeSetup.exe"

                Write-Host "Downloading VSCode"
                Invoke-WebRequest -Uri $vscodeInstallerUrl -OutFile $downloadPath
                Write-Host "Installing VSCode"
                # Start-Process -FilePath "$downloadPath" -ArgumentList "/verysilent /norestart" -Wait
            }
        }
    }
}

VSCode
Start-DscConfiguration -Path "VSCode" -Wait -Force 