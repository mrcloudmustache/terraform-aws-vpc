# terraform-aws-vpc

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.94.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.natgw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_networkmanager_vpc_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkmanager_vpc_attachment) | resource |
| [aws_route.default_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.default_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.subnet_private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet_private2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.subnet_public2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.private2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | The vpc ip address space | `any` | n/a | yes |
| <a name="input_core_network_id"></a> [core\_network\_id](#input\_core\_network\_id) | The CloudWAN core network ID | `string` | `""` | no |
| <a name="input_create_natgw"></a> [create\_natgw](#input\_create\_natgw) | Create a nat gateway | `bool` | `false` | no |
| <a name="input_create_vpc_attachment"></a> [create\_vpc\_attachment](#input\_create\_vpc\_attachment) | Create vpc attachment to CloudWAN | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment | `string` | `"dev"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the resource being created | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The name of the AWS region | `string` | `"us-east-1"` | no |
| <a name="input_segment"></a> [segment](#input\_segment) | The CloudWAN segment tag name | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private2_subnet_arn"></a> [private2\_subnet\_arn](#output\_private2\_subnet\_arn) | The arn of the subnet |
| <a name="output_private2_subnet_cidr"></a> [private2\_subnet\_cidr](#output\_private2\_subnet\_cidr) | The cidr block of the subnet |
| <a name="output_private2_subnet_id"></a> [private2\_subnet\_id](#output\_private2\_subnet\_id) | The ID of the subnet |
| <a name="output_private_subnet_arn"></a> [private\_subnet\_arn](#output\_private\_subnet\_arn) | The arn of the subnet |
| <a name="output_private_subnet_cidr"></a> [private\_subnet\_cidr](#output\_private\_subnet\_cidr) | The cidr block of the subnet |
| <a name="output_private_subnet_id"></a> [private\_subnet\_id](#output\_private\_subnet\_id) | The ID of the subnet |
| <a name="output_public2_subnet_arn"></a> [public2\_subnet\_arn](#output\_public2\_subnet\_arn) | The arn of the subnet |
| <a name="output_public2_subnet_id"></a> [public2\_subnet\_id](#output\_public2\_subnet\_id) | The ID of the subnet |
| <a name="output_public_subnet2_cidr"></a> [public\_subnet2\_cidr](#output\_public\_subnet2\_cidr) | The cidr block of the subnet |
| <a name="output_public_subnet_arn"></a> [public\_subnet\_arn](#output\_public\_subnet\_arn) | The arn of the subnet |
| <a name="output_public_subnet_cidr"></a> [public\_subnet\_cidr](#output\_public\_subnet\_cidr) | The cidr block of the subnet |
| <a name="output_public_subnet_id"></a> [public\_subnet\_id](#output\_public\_subnet\_id) | The ID of the subnet |
| <a name="output_vpc_attachment_id"></a> [vpc\_attachment\_id](#output\_vpc\_attachment\_id) | The ID of the VPC CloudWAN attachment |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
