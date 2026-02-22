# Project 4: Identity Automation with Microsoft Entra ID

This project demonstrates how to automate user provisioning in **Microsoft Entra ID (Azure AD)** using Terraform. Instead of manual entry, this configuration reads employee data from a source file and creates standardized user identities programmatically.



## 🚀 Key Features
- **Data-Driven Provisioning:** Uses `csvdecode` to parse a local `users_info.csv` file, making it easy to onboard dozens of users at once.
- **Dynamic UPN Generation:** Automatically constructs User Principal Names (UPNs) using the format: `[FirstInitial][LastName]@[TenantDomain]`.
- **Automated Password Logic:** Generates temporary, complex passwords for each user based on a combination of their name, string length, and a `random_string` resource.
- **Security-First Approach:** Sets `force_password_change = true`, ensuring users must update their temporary password upon their first login.
- **Dynamic Metadata:** Automatically populates `Department` and `Job Title` fields directly from the CSV data.

## 🏗️ Technical Implementation
- **AzureAD Provider:** Interfaces with your Entra ID tenant.
- **`for_each` Loops:** Iterates through the CSV list to create a unique resource for every row.
- **String Manipulation:** Uses functions like `substr`, `lower`, and `format` to normalize naming conventions across the organization.

## 🛠 Usage
1. **Prepare Data:** Ensure `users_info.csv` exists in the project folder with columns: `first_name`, `last_name`, `department`, and `job_title`.
2. **Authenticate:** Run `az login` with an account that has **User Administrator** or **Global Administrator** permissions.
3. **Deploy:** 
```bash
   terraform init
   terraform apply
```