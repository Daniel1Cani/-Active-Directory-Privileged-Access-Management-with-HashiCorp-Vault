# ⚙️ Vault & Active Directory Configuration Files

This folder contains redacted configuration files and reference screenshots used for the **Vault + AD PAM Lab**.

## Files

| File | Description |
|------|--------------|
| **vault.hcl** | Core Vault server configuration (listener, storage, API address). |
| **admins.hcl** | Policy granting full admin capabilities for testing. |
| **ad-password.hcl** | Password complexity policy applied to AD secrets engine. |
| **ad-config.png** | Output of `vault read ad/config`, confirming LDAP bind setup. |
| **vault-service.png** | Proof Vault service is running on Windows Server. |
| **aws-kms-seal.png** | (Optional) AWS KMS seal configuration for auto-unseal. |

> 🔒 Sensitive data has been redacted (no real credentials or tokens are included).

---

### 📸 Configuration Verification

**Vault AD Config**
![Vault AD Config](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/blob/screenshots/ad-config.png)

**Vault Service Running**
![Vault Service Running](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/blob/screenshots/vault-service.png)

**Active Directory OU (Service Accounts)**
![AD OU](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/blob/screenshots/ad-ou.png)

**Vault Credential Rotation Output**
![Vault Creds Admins](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/blob/screenshots/vault-creds-admins.png)
