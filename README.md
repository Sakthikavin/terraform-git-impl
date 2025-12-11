# Terraform GitHub Automation POC

This repository demonstrates how to use **Terraform + GitHub App Authentication** to automatically:

1. Create a new branch  
2. Create files inside that branch  
3. Commit the files  
4. Open a Pull Request  
5. (Optional) Generate GitHub Actions workflow files through Terraform  

This POC validates whether GitHub App–based authentication can fully automate GitHub repository changes **without using personal access tokens**.

---

## Why this repository exists

Engineering teams typically automate Git workflows using:

- Personal Access Tokens (PATs)  
- Fine-grained PATs  
- GitHub CLI tokens  

All of those are long-lived secrets and risky for production.

This POC explores a **secure, scalable alternative**:

### GitHub App Authentication  
- Short-lived tokens  
- Least-privilege permissions  
- No PAT exposure  
- Works inside GitHub Actions and local Terraform  
- Automates PR creation, file creation, workflow generation  

If validated, this approach can scale into:

- Automated PR generation pipelines  
- Data product onboarding automation  
- Metadata repository updates  
- Release automation  

---

# Repository Structure

```
terraform-git-impl/
│
├── poc/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfstate
│   └── private-key.pem   (local use only)
│
└── .github/
    └── workflows/
        └── terraform.yml
```

### What Terraform does:
- Reads the `main` branch SHA  
- Creates a feature branch  
- Adds YAML + workflow files  
- Opens a PR → main  
- Outputs PR URL  

---

# Prerequisites

### GitHub App Permissions Required

| Permission | Level |
|-----------|--------|
| Actions | Read & write |
| Workflows | Read & write |
| Contents | Read & write |
| Pull Requests | Read & write |

After updating permissions, reinstall the app.

---

### Required GitHub App Metadata

- `APP_PRIVATE_KEY` → PEM content  
- `APP_ID`  
- `APP_INSTALLATION_ID`  
- `GITHUB_ORG` → GitHub username  

---

# Running Terraform Locally

## 1. Place PEM file

```
poc/private-key.pem
```

## 2. Run Terraform

```bash
cd poc
terraform init
terraform apply -auto-approve
```

Outputs:

- Branch created  
- Files added  
- PR opened  

---

# Running via GitHub Actions

GitHub Actions workflow dynamically creates the PEM file.

### Required Secrets

| Secret | Description |
|--------|-------------|
| `APP_PRIVATE_KEY` | PEM content |
| `APP_ID` | GitHub App ID |
| `APP_INSTALLATION_ID` | Installation ID |
| `GITHUB_ORG` | Username |

Trigger manually under:

```
Actions → Terraform GitHub App Auth → Run workflow
```

---

# Troubleshooting

### 403: Resource not accessible by integration  
Missing `Workflows: Read & write` or App not reinstalled.

### No configuration files  
Terraform not running inside `poc/`.

### refusing to overwrite existing file  
Add:

```
overwrite_on_create = true
```

---

# Conclusion

This repository proves that GitHub Apps + Terraform can securely automate Git workflows without PATs.

