# Project 3: High-Availability Web Cluster (VMSS & Load Balancer)

This project automates the deployment of a scalable, resilient web infrastructure on Azure. It utilizes **Orchestrated Virtual Machine Scale Sets (VMSS)** sitting behind a **Standard Load Balancer**, ensuring the application can handle traffic spikes and hardware failures automatically.



## 🚀 Key Features
- **Elastic Scalability:** Configured with **Azure Monitor Autoscale** to scale between 1 and 5 instances based on CPU usage (>80% to scale up, <25% to scale down).
- **Traffic Distribution:** A **Standard Azure Load Balancer** distributes incoming HTTP (Port 80) traffic across the healthy VM instances.
- **Secure Egress:** Implements an **Azure NAT Gateway** to provide consistent outbound connectivity for the backend VMs.
- **Network Security:** A Network Security Group (NSG) strictly controls traffic, allowing only HTTP (80), HTTPS (443), and SSH (22).
- **Automated Provisioning:** Uses `user-data.sh` to automatically configure the Ubuntu servers upon launch.

## 🏗️ Architecture Components
- **Networking:** VNet and Subnets with `cidrsubnets` calculation.
- **Compute:** Orchestrated VMSS using Ubuntu 22.04 LTS.
- **Load Balancing:** Public IP with DNS label, Health Probes, and NAT rules for SSH access.
- **Reliability:** Zonal deployment (Zones 1, 2, 3) for the Public IP and NAT Gateway.

## 🛠 Usage
1. **Prepare User Data:** Ensure your `user-data.sh` script (e.g., Nginx installation) is in the root folder.
2. **Initialize:** `terraform init`
3. **Deploy:** `terraform apply`
4. **Verify Scaling:** You can stress the CPU of the VMs to watch the Scale Set trigger new instances automatically.

## 🔒 Security Note
The configuration currently allows password authentication for the `azureuser`. For production environments, it is recommended to switch to SSH Key authentication.