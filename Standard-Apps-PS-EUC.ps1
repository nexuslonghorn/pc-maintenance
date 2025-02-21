$apps = @("vlc.install", "googledrive")

Write-Output "Enabling Chocolatey Feature on machine..."
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Output "Enabling Global Confirmation"
choco feature enable -n allowGlobalConfirmation

Write-Output "Standard Apps Installer v1.0"
Write-Output "developed by Lindjie C."
Write-Output "Powered by Chocolatey"
foreach ($appName in $apps) {
    try {
          Write-Output " "
          Write-Output "Currently installing: $appName"
          $details = choco install $appName --force
          #$message = "$appName` : $details" 
          Write-Output "$appName` is successfully installed."
    }
    catch {
        $msg = "NOT FOUND"
        $details = "N/A"
        $message = "$appName` : $msg | App Value: $details" 
        Write-Output $message
    }
}

Write-Host "Execution now complete. Review errors if encountered; otherwise, you may close this window."