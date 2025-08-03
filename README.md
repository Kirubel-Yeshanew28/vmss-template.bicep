Azure Load Balancer + VM Scale Set (VMSS) Deployment

This project simulates a scalable and highly available web app setup using Azure Load Balancer and Virtual Machine Scale Set (VMSS). It is designed based on best practices learned through AZ-104 training and hands-on simulation.

##  What’s Included

- Public Load Balancer with HTTP Load Balancing (Port 80)
- VM Scale Set with automatic scaling
- Custom script extension to install NGINX on each instance
- Secure NSG allowing only HTTP inbound
- Infrastructure as Code with Bicep

##  Files

- `vmss-template.bicep` – deploys VMSS
- `lb-template.bicep` – deploys Public Load Balancer
- `architecture.png` – infrastructure diagram
- `manual-steps.md` – step-by-step portal deployment (optional)

##  Scenario

This setup mimics how real-world applications achieve **fault tolerance**, **load distribution**, and **easy scaling** — without manual VM management.

##  Notes

- No portal used; simulated and defined entirely via infrastructure code
- Inspired by real AZ-104 training and architecture practices
