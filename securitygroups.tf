resource "aws_security_group" "mysecuritygroup" {
    name = "mysecuritygroup"
    description = "My security group"
    vpc_id = module.vpc.vpc_id
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
                "10.0.0.0/8",
                "172.16.0.0/12",
                "192.168.0.0/16",
        ]
    }
     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
     }
   }