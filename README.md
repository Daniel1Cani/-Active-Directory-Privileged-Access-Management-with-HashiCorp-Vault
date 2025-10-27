# ⚙️ Vault & AD Automation Scripts

This branch contains PowerShell scripts used to automate and manage the **HashiCorp Vault + Active Directory PAM Lab**.

| Script | Description |
|---------|-------------|
| **vault-start.ps1** | Starts Vault server using the config file located at `C:\vault\config.hcl`. |
| **unseal-vault.ps1** | Checks Vault seal status and automatically unseals it using your unseal key. |
| **ad-setup.ps1** | Creates the AD service accounts (`svc-vault-bind` and `vault-managed-admin`). |
| **delegate-reset.ps1** | Grants the bind account permission to reset passwords for managed accounts. |

> 🛑 **Note:** All passwords and keys in these examples are placeholders and should be changed in your environment.

### 📸 Example Output
![Vault_Status](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/vault-service.png)

---

**Usage Example**
```powershell
# Run scripts in Administrator PowerShell
.\vault-start.ps1
.\unseal-vault.ps1
