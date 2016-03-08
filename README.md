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
* it is assumed that your user has write priviliges to `/usr/local/bin`
* The `direnv` hook adds `./bin` to your PATH in the current shell session only.

# Deploying a BOSH VPC

First you will need to add your credentials to the appropriate location.

Copy the example file to the `terraform.tfvars` file:
```
cp terraform/aws/terraform.tfvars.example terraform/aws/terraform.tfvars
```
Next edit the file and replace the values with your AWS account credentials.

## Deploying

In order to *deploy* a VPC,

```
make deploy
```

## Destorying

In order to *destroy* a previously deployed VPC,

```
make destroy
```

