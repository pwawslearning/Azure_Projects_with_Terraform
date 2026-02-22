# Project 3: Configuring Azure Remote Backend

This project focuses on operational best practices by migrating the Terraform state file from a local environment to a remote **Azure Backend**. This ensures state locking, security, and team collaboration.



## 🚀 Key Features
- **State Persistence:** Stores the `terraform.tfstate` file in an Azure Storage Container.
- **Version Constraint:** Enforces the use of `azurerm` provider version `~> 4.17.0` and Terraform version `>= 1.9.0`.
- **Security:** Keeps sensitive infrastructure metadata off local machines and in managed Azure storage.

## 🏗️ Configuration Breakdown
The `backend "azurerm"` block connects to the infrastructure created in **Project 2**:
- **Resource Group:** `project_01`
- **Storage Account:** `storagewithterraform01`
- **Container:** `tfstate`
- **State Key:** `test.terraform.tfstate`

## 🛠 Usage & Initialization
Because the backend is now remote, you must initialize with the backend configuration:

1. **Initialize:** ```bash
   terraform init