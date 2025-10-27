# 🧠 Active Directory Privileged Access Management with HashiCorp Vault

This project demonstrates how to build an **open-source Privileged Access Management (PAM)** system using **HashiCorp Vault** integrated with **Active Directory (AD)** and **AWS Key Management Service (KMS)** for secure auto-unseal.

It eliminates static service passwords by allowing Vault to dynamically rotate Active Directory credentials — similar to how enterprise PAM tools like CyberArk or BeyondTrust function, but with an open-source stack that can run fully in AWS or on-prem.

---

## 🏗️ Architecture

**Architecture Diagram**

![Architecture_Diagram](https://github.com/Daniel1Cani/Active-Directory-Privileged-Access-Management-with-HashiCorp-Vault/raw/Screenshots/vault-ad-diagram.png)

**Components**

| Component | Description |
|------------|-------------|
| **Vault Server (Windows Server)** | Runs the Vault service with the **Active Directory Secrets Engine**. It’s configured to use **AWS KMS auto-unseal**, meaning Vault automatically decrypts its master key using AWS’s Key Management Service after reboots — no manual key entry required. |
| **Domain Controller (DC01)** | The Active Directory domain `corp.local`, hosting organizational units and user accounts. |
| **Bind Account (`svc-vault-bind`)** | Lightweight AD service account used by Vault to connect securely to AD via **LDAPS**. |
| **Managed Account (`vault-managed-admin`)** | An AD service account whose password Vault dynamically rotates based on TTL or manual trigger. |
| **Admin User (`dc_admin`)** | Authenticates to Vault via LDAP and manages secrets, roles, and rotation policies. |
| **AWS KMS** | Provides automatic unseal for Vault using a managed encryption key, improving resilience and eliminating manual unseal steps. |

---

## 🔄 Credential Rotation Flow

1. Vault connects to AD using the **bind account** (`svc-vault-bind`).
2. The authorized admin (`dc_admin`) logs into Vault through **LDAP authentication**.
3. The admin reads the role `ad/creds/admins` to retrieve dynamic credentials.
4. Vault automatically resets the password for `vault-managed-admin` in Active Directory.
5. The old password becomes invalid immediately.
6. Vault audit logs record the event, preserving traceability.

*(See the [Screenshots branch](../../tree/Screenshots) for live examples and verification images.)*

---

## ⚙️ Configuration Steps

### 1️⃣ Enable and Configure the AD Secrets Engine

```bash
vault secrets enable ad

vault write ad/config `
  binddn="CN=svc-vault-bind,OU=ServiceAccounts,DC=corp,DC=local" `
  bindpass="SVC_BIND_PASSWORD" `
  url="ldaps://dc01.corp.local" `
  userdn="OU=ServiceAccounts,DC=corp,DC=local" `
  insecure_tls=true
