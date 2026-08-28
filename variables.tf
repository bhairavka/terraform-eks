variable "aws_region" {
    description = "The AWS region to deploy resources in"
    type = string
    default = "us-east-1"
}
variable "environment" {
    description = "The environment name (e.g., dev, staging, prod)"
    type = string
    default = "dev"
}
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}
variable "cluster_name" {
    description = "The name of the EKS cluster"
    type = string
    default = "my-eks-cluster"
}
variable "cluster_version" {
    description = "The version of the EKS cluster"
    type = string
    default = "1.32"
}
