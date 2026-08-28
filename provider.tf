terraform {
    required_version = ">=1.10.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>5.70"
        }
    }
    backend "s3" {
        bucket = "terraform-eks-13-bucket"
        key = "eks/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        encrypt = true
    }
    }
    provider "aws" {
        region = var.aws_region
    }    
