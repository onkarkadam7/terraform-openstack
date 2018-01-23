#
# Global Configuration
#
variable "region" { default = "RegionOne" }
variable "availability_zone" { default = "HDD"}
variable "keypair" { default = "default" }
variable "security_group" { default = "default" }

# Instance configuation
# Flavors
variable "flavor_name_slave" { default = "ram128cpu12root100eph2048"}
variable "flavor_name_master" { default = "ram128cpu12root100"}
variable "flavor_name_general" { default = "ram32cpu8root100"}
# Base Image
variable "image_name" { default = "centos_7.3_base"}

