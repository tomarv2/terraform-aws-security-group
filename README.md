# terraform-securitygroup
Terraform module for Security Group

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| aws | ~> 2.61 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.61 |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| email | Team email, not individual email | `any` | n/a | yes |
| prjid | Name of the project/stack.  EG: mystack | `any` | n/a | yes |
| service\_ports | n/a | `any` | n/a | yes |
| teamid | Name of the team or group e.g. devops, dataengineering. Should not be changed after running 'tf apply'. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | The ID of the default security group associated with the ECS container instances. |

