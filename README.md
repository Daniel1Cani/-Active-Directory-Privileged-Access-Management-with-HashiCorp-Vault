# 🧠 Active Directory Privileged Access Management with HashiCorp Vault

## 📘 Overview
This project demonstrates how to build an **open-source Privileged Access Management (PAM)** system using **HashiCorp Vault** integrated with **Active Directory (AD)**.  
The setup eliminates static privileged passwords by allowing Vault to dynamically rotate AD service account credentials, just like CyberArk or BeyondTrust do in enterprise environments.

---

## 🧩 Architecture

**Components**
- **Vault Server (Windows Server)** – Runs Vault with the Active Directory secrets engine.
- **Domain Controller (DC01)** – Active Directory domain `corp.local`.
- **Bind Account (`svc-vault-bind`)** – Used by Vault to connect securely to AD via LDAPS.
- **Managed Account (`vault-managed-admin`)** – AD user whose password Vault rotates dynamically.
- **Admin User (`dc_admin`)** – Authenticates to Vault through LDAP for management actions.

### 🔄 Credential Rotation Flow
1. Vault connects to AD using the bind account (`svc-vault-bind`).
2. An authorized AD user logs into Vault via LDAP.
3. The user runs `vault read ad/creds/admins`.
4. Vault resets the password for `vault-managed-admin` and returns the new one.
5. The old password immediately becomes invalid.
6. Audit logs capture the entire event for traceability.

*(Insert architecture diagram here — you can export one from draw.io or diagrams.net later.)*

---

## ⚙️ Configuration Steps

### 1️⃣ Enable and Configure the AD Secrets Engine
```powershell
vault secrets enable ad

vault write ad/config `
  binddn="CN=svc-vault-bind,OU=ServiceAccounts,DC=corp,DC=local" `
  bindpass="<SVC_BIND_PASSWORD>" `
  url="ldaps://dc01.corp.local" `
  userdn="OU=ServiceAccounts,DC=corp,DC=local" `
  insecure_tls=true
