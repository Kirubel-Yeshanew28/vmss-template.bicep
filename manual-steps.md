Manual Deployment Steps for Azure Load Balancer + VMSS

This guide outlines how to deploy this project manually in the Azure Portal (if needed).

---

## Step 1: Virtual Network
- Create VNet with address space `10.0.0.0/16`
- Add subnet named `app-subnet` → `10.0.1.0/24`

## Step 2: Public IP
- Create a public IP address named `webapp-pip`

## Step 3: Load Balancer
- Use Standard SKU
- Add frontend IP configuration (linked to public IP)
- Add backend pool: `backendpool1`
- Add health probe (TCP, port 80)
- Add load balancing rule: frontend 80 → backend 80

## Step 4: VM Scale Set
- Image: Ubuntu
- Admin credentials
- Custom script to install nginx:
  ```bash
  #!/bin/bash
  sudo apt update
  sudo apt install -y nginx
  sudo systemctl enable nginx