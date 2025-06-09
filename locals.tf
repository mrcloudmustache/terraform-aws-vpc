locals {
  calculated_subnets = cidrsubnets(var.cidr_block, 6, 6, 6, 6)
  private_subnet     = local.calculated_subnets[0]
  private_subnet2    = local.calculated_subnets[1]
  public_subnet      = local.calculated_subnets[2]
  public_subnet2     = local.calculated_subnets[3]

}
