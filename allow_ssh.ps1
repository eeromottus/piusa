# Remove any custom SSH block rules
Get-NetFirewallRule |
Where-Object {
    $_.DisplayName -like "*SSH*" -or
    $_.DisplayName -like "*OpenSSH*"
} |
Remove-NetFirewallRule -ErrorAction SilentlyContinue

# Recreate the default OpenSSH allow rule
New-NetFirewallRule `
    -DisplayName "OpenSSH-Server-In-TCP" `
    -Direction Inbound `
    -Action Allow `
    -Protocol TCP `
    -LocalPort 22 `
    -Profile Any

Write-Host "SSH firewall rule restored."