locals {
    calculated_subnets = cidrsubnets(var.cidr_block, 6, 6, 6, 6)
    private_subnet_1 = local.calculated_subnets[0]
    private_subnet_2 = local.calculated_subnets[1]
    public_subnet_1 = local.calculated_subnets[2]
    public_subnet_2 = local.calculated_subnets[3]

}

locals {
  bgp_configs = flatten([
    for peer in aws_networkmanager_connect_peer.peer.configuration : peer.bgp_configurations
  ])

  core_network_addresses = [for config in local.bgp_configs : config.core_network_address]
  peer_addresses         = [for config in local.bgp_configs : config.peer_address]
  peer_asns              = [for config in local.bgp_configs : config.peer_asn]
  core_network_asns      = [for config in local.bgp_configs : config.core_network_asn]

  bgp_configs_2 = flatten([
    for peer in aws_networkmanager_connect_peer.peer2.configuration : peer.bgp_configurations
  ])

  core_network_addresses_2 = [for config in local.bgp_configs_2 : config.core_network_address]
  peer_addresses_2         = [for config in local.bgp_configs_2 : config.peer_address]
  peer_asns_2             = [for config in local.bgp_configs_2 : config.peer_asn]
  core_network_asns_2      = [for config in local.bgp_configs_2 : config.core_network_asn]
}