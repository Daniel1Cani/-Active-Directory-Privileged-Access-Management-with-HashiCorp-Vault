# Create Service Accounts for Vault-AD Integration

Import-Module ActiveDirectory

# Create Bind Account
New-ADUser -Name "svc-vault-bind" -SamAccountName "svc-vault-bind" `
  -Path "OU=ServiceAccounts,DC=corp,DC=local" `
  -AccountPassword (ConvertTo-SecureString "BindP@ssw0rd!2025" -AsPlainText -Force) `
  -Enabled $true -PasswordNeverExpires $true

# Create Managed Account
New-ADUser -Name "vault-managed-admin" -SamAccountName "vault-managed-admin" `
  -Path "OU=ServiceAccounts,DC=corp,DC=local" `
  -AccountPassword (ConvertTo-SecureString "VaultTempP@ssw0rd!" -AsPlainText -Force) `
  -Enabled $true -PasswordNeverExpires $true

