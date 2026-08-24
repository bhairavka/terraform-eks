data "aws_availability_zones" "available" {}


module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "5.7.0"
    name = "${var.environment}-vpc"
    azs = data.aws_availability_zones.available.names
    cidr = var.vpc_cidr
    public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
    enable_nat_gateway = true
    enable_single_nat_gateway = true
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    }
   private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
   }
   public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
   }
}

module "eks" {
    source = "terreform-aws-modules/eks/aws"
    version = "20.8.4"
    cluster_name = var.cluster_name
    cluster_version = var.cluster_version
    vpc_id = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets
    enable_irsa = true
    eks_managed_node_group_defaults = {
        instance_types = ["t3.medium"]

    }
    eks_managed_node_groups = {
        node_group = {
            desired_size = 2
            max_size =3
            min_size = 1
            vpc_security_group_ids = [aws_security_group.mysecuritygroup.id]
        }
    }
}

