Configuration DownloadVSCode {

  Import-DscResource -ModuleName PsDesiredStateConfiguration

    Node localhost {
        Script DownloadVSCode {
            GetScript = {
                Write-Output "Checking if the vscode installation is present"
                $filePath = "C:\Temp"
                $vscodeInstalled = Get-Command code -ErrorAction SilentlyContinue
                return @{ Result = if (Test-Path $filePath) { "True" } else { "False" }}
            }
            TestScript = {
                Write-Host "Running the test script for vscode"
                $filePath = "C:\Temp"
                return Test-Path $filePath

            }
            SetScript = {
                $vscodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64"               
                $downloadPath = "C:\Temp"

                Write-Host "Downloading VSCode"
                Invoke-WebRequest -Uri $vscodeInstallerUrl -OutFile $downloadPath
                Write-Host "Installing VSCode"
                # Start-Process -FilePath "$downloadPath" -ArgumentList "/verysilent /norestart" -Wait
            }
        }
    }
}

DownloadVSCode
Start-DscConfiguration -Path "DownloadVSCode" -Wait -Force 