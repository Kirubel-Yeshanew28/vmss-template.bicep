resource lb 'Microsoft.Network/loadBalancers@2021-05-01' = {
  name: 'webapp-lb'
  location: resourceGroup().location
  sku: {
    name: 'Basic'
  }
  properties: {
    frontendIPConfigurations: [
      {
        name: 'frontend'
        properties: {
          publicIPAddress: {
            id: '/subscriptions/your-subscription-id/resourceGroups/your-rg/providers/Microsoft.Network/publicIPAddresses/webapp-pip'
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'backendpool1'
      }
    ]
    loadBalancingRules: [
      {
        name: 'http-rule'
        properties: {
          frontendIPConfiguration: {
            id: '${lb.id}/frontendIPConfigurations/frontend'
          }
          backendAddressPool: {
            id: '${lb.id}/backendAddressPools/backendpool1'
          }
          probe: {
            id: '${lb.id}/probes/healthprobe1'
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
          enableFloatingIP: false
          idleTimeoutInMinutes: 4
          loadDistribution: 'Default'
        }
      }
    ]
    probes: [
      {
        name: 'healthprobe1'
        properties: {
          protocol: 'Tcp'
          port: 80
          intervalInSeconds: 15
          numberOfProbes: 4
        }
      }
    ]
  }
}
