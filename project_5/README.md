# Project 5: Azure VNET Peering & Cross-Network Connectivity

This project demonstrates how to bridge two isolated Virtual Networks (VNETs) using **VNET Peering**. By establishing a bi-directional peer, Virtual Machines in `VNET-A` can communicate with Virtual Machines in `VNET-B` using private IP addresses as if they were on the same network.



## 🚀 Key Features
- **Dual Network Provisioning:** Creates two distinct Virtual Networks (`VNET-A` and `VNET-B`) in separate Resource Groups.
- **Bi-directional Peering:** Implements two `azurerm_virtual_network_peering` resources to ensure traffic can flow both ways.
- **Dynamic Subnetting:** Uses the `cidrsubnets` function to calculate address prefixes dynamically for subnets.
- **Compute Verification:** Deploys two Ubuntu 22.04 LTS Virtual Machines (one in each VNET) to test and verify private connectivity.
- **Regional Flexibility:** Supports deploying VNETs in different locations using variable arrays.

## 🏗️ Architecture Components
- **VNET A:** Located in the first target region, hosting `vmA`.
- **VNET B:** Located in the second target region, hosting `vmB`.
- **Peering Links:** - `VNETA_TO_VNETB`
  - `VNETB_TO_VNETA`
- **Security:** VMs are configured with password authentication for quick testing and verification.

## 🛠 Usage
1. **Configure Variables:** Ensure `var.location` contains at least two regions (e.g., `["East US", "West US"]`) in your `variables.tf` or `terraform.tfvars`.
2. **Initialize:**
 ```bash
   terraform init
 ```
3. **Deploy:**
```bash
   terraform apply --auto-approve
```
4. **Test Connectivity:**

- SSH into vmA.
- Ping the private IP of vmB.
- The traffic travels over the Azure private backbone, not the public internet.