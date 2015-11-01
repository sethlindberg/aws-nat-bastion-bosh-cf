variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}
variable "aws_region" {
  default = "us-east-1"
}
variable "network" {
	default = "10.10"
}
variable "cf_admin_pass" {
  default = "c1oudc0wc1oudc0w"
}
variable "bosh_type" {
  default = "ruby"
}
variable "bosh_init_version" {
  default = "0.0.80"
}

variable "aws_centos_ami" {
  default = {
    us-east-1 = "ami-61bbf104"
    us-west-1 = "ami-ba3c3bff"
    us-west-2 = "ami-3425be04"
    ap-northeast-1 = "ami-9392dc92"
    ap-southeast-1 = "ami-dcbeed8e"
    ap-southeast-2 = "ami-89e88db3"
    eu-west-1 = "ami-af6faad8"
    sa-east-1 = "ami-73ee416e"
  }
}

