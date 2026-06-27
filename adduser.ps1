$username = "localeero"
$password = ConvertTo-SecureString "ChangeMe123!" -AsPlainText -Force

if (-not (Get-LocalUser -Name $username -ErrorAction SilentlyContinue)) {
    New-LocalUser `
        -Name $username `
        -Password $password `
        -FullName "Eero Mottus" `
        -Description "Account for Ansible management" `
        -PasswordNeverExpires

    Add-LocalGroupMember `
        -Group "Administrators" `
        -Member $username
    Enable-LocalUser -Name $username
}
