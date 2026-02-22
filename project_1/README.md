# Project 1: Azure Storage Infrastructure

This project automates the creation of an **Azure Storage Account** and a **Blob Container** using Terraform. This setup is a foundational component for storing unstructured data or managing Terraform backend state files.



## 🚀 Key Features
- **Resource Group Management:** Provisions a dedicated resource group (`storage-rg-01`) in the Southeast Asia region.
- **Storage Tiering:** Configures a `Standard` tier storage account with **Locally Redundant Storage (LRS)** for cost-effective data redundancy.
- **Blob Container:** Automatically creates a container named `tfstate` with `blob` level public access.
- **Tagging:** Implements resource tagging for better environment organization and billing tracking.

## 🏗️ Resources Defined
- `azurerm_resource_group`: The logical container for the storage resources.
- `azurerm_storage_account`: The top-level storage entity (`storagewithterraform01`).
- `azurerm_storage_container`: A specific container named `tfstate` within the storage account.

## 🛠 Usage
1. Initialize the directory: `terraform init`
2. Preview the infrastructure: `terraform plan`
3. Deploy the storage: `terraform apply`

## 📊 Infrastructure Details
| Resource | Name | Setting |
| :--- | :--- | :--- |
| **Region** | Southeast Asia | Location |
| **Account Tier** | Standard | Performance |
| **Replication** | LRS | Redundancy |
| **Container** | tfstate | Access: Blob |