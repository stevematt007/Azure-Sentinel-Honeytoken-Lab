# Azure-Sentinel-Honeytoken-Lab
Cloud Security Purple Team Lab: Building an Entra ID Honeytoken and custom Azure Sentinel (SIEM) detection rule
# Cloud Security: Azure Sentinel & Entra ID Honeytoken Trap 🚨

## Objective
The goal of this project was to engineer a custom Cloud Security detection mechanism using a "Honeytoken" (fake Azure cloud credentials). By simulating a threat actor discovering exposed `.env` credentials, I generated malicious login telemetry and built an automated Sentinel (SIEM) rule to catch the attack with zero false positives. 

### Skills Learned
- **Cloud Identity Access Management (IAM):** Creating Zero-Privilege Entra ID accounts.
- **Security Information and Event Management (SIEM):** Ingesting cloud logs into Microsoft Sentinel.
- **Kusto Query Language (KQL):** Writing custom queries to parse Sign-in logs and extract attacker IPs.
- **MITRE ATT&CK Mapping:** Mapping custom analytics rules to Tactic: Credential Access (TA0006) and Technique: Brute Force (T1110).

### Tools Used
- Microsoft Entra ID (formerly Azure AD)
- Microsoft Sentinel (SIEM) / Microsoft Defender Unified Portal
- Azure CLI / PowerShell (for attack simulation)
- KQL (Kusto Query Language)

---

## The Attack & Defense Lifecycle

### 1. Planting the Trap (Red Team)
A fake Global Admin account (`azuredbbackupadmin`) was created in Entra ID with no actual permissions. The credentials were saved in a `.env` file to simulate a credential leak.
*(Insert Screenshot of .env file)*

### 2. Simulating the Attack (Red Team)
Using the exposed credentials, I simulated a brute-force dictionary attack against the Azure login portal.
*(Insert Screenshot of failed login attempts)*

### 3. Log Ingestion & Threat Hunting (Blue Team)
I connected Entra ID Sign-in logs to a Microsoft Sentinel Log Analytics Workspace. Using KQL, I queried the raw logs to identify the attacker's IP address, timestamp, and User-Agent.
*(Insert Screenshot of KQL query and raw logs)*

### 4. Building the Analytics Rule (Blue Team)
To automate detection, I engineered a Scheduled Analytics Rule mapped to the MITRE ATT&CK framework. The rule runs every 5 minutes to detect any login attempts against the Honeytoken.
*(Insert Screenshot of the Active Analytics Rule)*

### 5. The Incident Alert (Blue Team)
The SIEM successfully fired off a High-Severity incident ticket, detailing the exact footprint of the attacker.
*(Insert Screenshot of the final Incident Alert)*
