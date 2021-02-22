[![](https://img.shields.io/badge/license-Apache%202-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

# terraform-securitygroup
Terraform module for [SecurityGroups](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

## Versions

- Module tested for Terraform 0.14.
- AWS provider version [3.29.0](https://registry.terraform.io/providers/hashicorp/aws/latest)
- `main` branch: Provider versions not pinned to keep up with Terraform releases
- `tags` releases: Tags are pinned with versions (use tag latest tag in your releases)

**NOTE:** 

- Read more on [tfremote](https://github.com/tomarv2/tfremote) 
- I will not be pinning the main branch to keep up with Terraform releases, for deployments please
use the latest tag versions which have versions pinned for stability.

## How to use?

Recommended method:

- Create python 3.6+ virtual environment 
```
python3 -m venv <venv name>
```

- Install package:
```
pip install tfremote
```

- Set below environment variables:
```
export TF_AWS_BUCKET=<remote state bucket name>
export TF_AWS_PROFILE=default
export TF_AWS_BUCKET_REGION=us-west-2
export PATH=$PATH:/usr/local/bin/
```  

- Update:
```
example/custom/sample.tfvars
```

- Following entries are required:
```
- account_id
- function_name
- role_arn
- source_file (relative path to the base directory or provide absolute path)
- output_file_path
- teamid
- prjid
```

- Change to: 
```
example/base
``` 

- Run and verify the output before deploying:
```
tf -cloud aws plan -var-file <path to .tfvars file>
```

- Run below to deploy:
```
tf -cloud aws apply -var-file <path to .tfvars file>
```

- Run below to destroy:
```
tf -cloud aws destroy -var-file <path to .tfvars file>
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_region | The AWS region to create resources | `string` | `"us-west-2"` | no |
| email | email address to be used for tagging (suggestion: use group email address) | `any` | n/a | yes |
| prjid | (Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply' | `any` | n/a | yes |
| profile\_to\_use | Getting values from ~/.aws/credentials | `any` | n/a | yes |
| service\_ports | n/a | `list` | <pre>[<br>  "80",<br>  "443"<br>]</pre> | no |
| teamid | (Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply' | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_id | The ID of the default security group associated with the ECS container instances. |
