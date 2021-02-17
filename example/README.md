# AWS Security Groups

Terraform to create Security Group on AWS.

This module focuses on [SecurityGroups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

**NOTE:** In most cases creating resources is heavily opinionated and or context-bound.

## Terraform versions

Terraform 0.12 

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
| securitygroup\_id | The ID of the default security group associated with the ECS container instances. |

