param adminUsername string = 'azureuser'
@secure()
param adminPassword string

resource vmss 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: 'webapp-vmss'
  location: resourceGroup().location
  sku: {
    name: 'Standard_B1s'
    tier: 'Standard'
    capacity: 2
  }
  properties: {
    upgradePolicy: {
      mode: 'Manual'
    }
    virtualMachineProfile: {
      storageProfile: {
        imageReference: {
          publisher: 'Canonical'
          offer: 'UbuntuServer'
          sku: '18.04-LTS'
          version: 'latest'
        }
      }
      osProfile: {
        computerNamePrefix: 'webvm'
        adminUsername: adminUsername
        adminPassword: adminPassword
        customData: base64('
          #!/bin/bash
          sudo apt update
          sudo apt install -y nginx
          sudo systemctl enable nginx
        ')
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: 'vmss-nic'
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: 'ipconfig1'
                  properties: {
                    subnet: {
                      id: '/subscriptions/your-subscription-id/resourceGroups/your-rg/providers/Microsoft.Network/virtualNetworks/your-vnet/subnets/your-subnet'
                    }
                    loadBalancerBackendAddressPools: [
                      {
                        id: '/subscriptions/your-subscription-id/resourceGroups/your-rg/providers/Microsoft.Network/loadBalancers/your-lb/backendAddressPools/backendpool1'
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
}
