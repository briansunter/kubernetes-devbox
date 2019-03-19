module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region    = "us-east-1"
  cluster_name  = "kube"
  aws_instance_type = "t2.medium"
  ssh_public_key = "~/.ssh/id_rsa.pub"
  aws_subnet_id = "subnet-0b6cb650f9a06b80e"
  ami_image_id = "ami-b81dbfc5"
  hosted_zone = "bsun.io"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/ingress.yaml"
  ]
}
