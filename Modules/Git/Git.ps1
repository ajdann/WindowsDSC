Configuration Git {
    Node localhost {
        Script InstallGit {
            SetScript = {
                # Run the winget install command
                $wingetCommand = "winget install --id Git.Git -e --source winget"
                Invoke-Expression $wingetCommand
            }
            TestScript = {
                # Test if Git is installed
                return [bool](Get-Command -Name "git" -ErrorAction SilentlyContinue)
            }
            GetScript = {
                return @{ Result = if ([bool](Get-Command -Name "git" -ErrorAction SilentlyContinue)) { "True" } else { "False" }}
             }
        }
    }
}

# Uncomment the line below to run the configuration
Git
Start-DscConfiguration -Path "Git" -Wait -Force -Verbose