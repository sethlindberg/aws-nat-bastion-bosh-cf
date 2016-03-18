# NAT, Bastion & BOSH Bootstrapping

This repository contains all of the scripts necessary for bootstrapping a NAT, Bastion & BOSH on AWS.

Note that throught this effort manual steps will appear anywhere that credentials are required.

# Generations

Note that this is the next evolution of the [terraform-aws-cf-install](https://github.com/cloudfoundry-community/terraform-aws-cf-install) project.

It is a separate repository so that important projects using the original repository are not affected by forward progress.

The goals of this evolution are

1. Modular.
3. Use the new `bosh-init` method for bootstrapping.
4. Use spruce.
2. Flexible Sizing (select different sizes of CF to install, even customize your own).

Terraform is still the tool of choice for for initializing the AWS VPC as well as the NAT and Bastion EC2 instances.

Note that currently the NAT, Bastion and BOSH Director VMs are intentionally created as small as possible.
For full production systems it is advised that your Bsation and BOSH Director are larger VMs.

# Preparation

First, this project uses `direnv`, if you do not have `direnv` available please
first install it: (direnv.net)[http://direnv.net]

Be sure to run `direnv` allow when you change in to this project directory.


To prepare the environment in order to run the automation, first run the following:

```sh
make prepare
```

Notes
* it is assumed that your user has write privileges to `/usr/local/bin`
* The `direnv` hook adds `./bin` to your PATH in the current shell session only.
* If you will be finding new stemcell ID's be sure to install `awscli`

# Deploying a BOSH VPC

First you will need to add your credentials to the appropriate location.

Copy the example file to the `terraform.tfvars` file:
```sh
cp terraform/aws/terraform.tfvars.example terraform/aws/terraform.tfvars
```
Next edit the file and replace the values with your AWS account credentials.

## Create the VPC, NAT and Bastion (Jump Box)

In order to *deploy* a VPC, NAT and Bastion Box:

```sh
make plan
make apply
make provision-base
```

## Create BOSH Director (via bosh-init)

```sh
make provision-bosh
```

## Destroying Everything

In order to *destroy* a previously deployed VPC,

```sh
make destroy
```

## EC2 Image ID Updates

We found the AMI ID's by getting the product code from this website.
Then ran the following code substituting in the product code value:
```sh
make centos-ami-ids
```
Note that you have to first run `aws configure` to setup your AWS credentials.
The outputed values should replace the old ones within the `variables.tf` file.
Specifically the `variable "aws_centos_ami" {` section.

## Troubleshooting

If this message is received:
```
Error applying plan:

1 error(s) occurred:

* aws_instance.bastion: Error launching source instance: OptInRequired: In order to use this AWS Marketplace product you need to accept terms and subscribe. To do so please visit http://aws.amazon.com/marketplace/pp?sku=aw0evgkw8e5c1q413zgy5pjce
	status code: 401, request id:

Terraform does not automatically rollback in the face of errors.
Instead, your Terraform state file has been partially updated with
any resources that successfully completed. Please address the error
above and apply again to incrementally change your infrastructure.
```
Go to the URL in the error message and click "Manual Launch" tab (for EC2 APIs / CLI) and click the giant orange button to "Accept Software Terms". Then re-run the commands.
