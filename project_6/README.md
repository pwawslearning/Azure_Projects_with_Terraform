# Project 6: Deploying Azure Container Instances (ACI)

This project uses Terraform to deploy a serverless containerized application using **Azure Container Instances (ACI)**. It pulls a "Hello World" image from the Microsoft Container Registry and makes it accessible via a public DNS label.



## 🚀 Key Features
- **Serverless Containers:** Runs containers without managing any virtual machines.
- **Public Connectivity:** Configures a Public IP and DNS name label (`aci-label`).
- **Resource Management:** Allocates specific CPU (0.5) and Memory (1.5 GB) limits.
- **Linux OS:** Deploys a Linux-based container environment.

## 🏗️ Resources Defined
- `data.azurerm_resource_group`: Fetches an existing Resource Group.
- `azurerm_container_group`: Provisions the container group and the `hello-world` container.

## 🛠 Usage
1. Update `variables.tf` with your existing Resource Group name.
2. Initialize: `terraform init`
3. Deploy: `terraform apply`
4. Access the app: Once deployed, navigate to `http://aci-label.<region>.azurecontainer.io` in your browser.