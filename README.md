# 🖼️ Vault + Active Directory PAM Lab – Screenshots

This branch contains verification screenshots captured during the setup and testing of the **Active Directory Privileged Access Management (PAM)** system using **HashiCorp Vault**.  
Each screenshot demonstrates key points in the integration and credential rotation workflow.

---

## 🔧 Configuration Verification

**1️⃣ Vault AD Config**
> Output of `vault read ad/config` confirming a successful connection to Active Directory via LDAPS.  
![Vault_AD_Config](https://github.com/Daniel1Cani/-Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/ad-config.png)

**2️⃣ Vault Service Running**
> Shows Vault running on the Windows Server host (`vault.exe` process).  
![Vault_Service](https://github.com/Daniel1Cani/-Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/vault-service.png)

**3️⃣ Active Directory OU (Service Accounts)**
> Displays the `OU=ServiceAccounts` folder within Active Directory containing both the bind and managed accounts.  
![AD_OU](https://github.com/Daniel1Cani/-Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/ad-ou.png)

**4️⃣ Vault Credential Rotation Output**
> Demonstrates Vault dynamically rotating the `vault-managed-admin` account password.  
![Vault_Creds_Admins](https://github.com/Daniel1Cani/-Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/vault-creds-admins.png)

---

> ⚠️ All screenshots were taken in a **controlled lab environment**.  
> Sensitive data has been redacted or replaced with placeholders for security.
