# NAT, Bastion & BOSH Bootstrapping

This repository contains all of the scripts necessary for bootstrapping a NAT, Bastion & BOSH on AWS.

Note that throught this effort manual steps will appear anywhere that credentials are required.

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

