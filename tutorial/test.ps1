$filePath = "C:\Path\To\Your\File.txt"

# Check if the file exists
if (Test-Path $filePath) {
    Write-Output "File exists at $filePath."
} else {
    Write-Output "File does not exist at $filePath."
}