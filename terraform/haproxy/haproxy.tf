variable "user" {}
variable "key_path" {}
variable "primary_consul" {}
variable "subnet_id" {}
variable "xlb_sg_id" {}

data "atlas_artifact" "haproxy" {
  name = "bgreen/haproxy"
  type = "amazon.image"
  build = "latest"
}

resource "aws_instance" "haproxy" {
    ami = "${data.atlas_artifact.haproxy.metadata_full.region-us-east-1}"
    instance_type = "t2.micro"
    count = "1"
    subnet_id = "${var.subnet_id}"
    vpc_security_group_ids = ["${var.xlb_sg_id}"]
    tags = {
      env = "xlb-demo"
    }
    connection {
        user = "${var.user}"
        private_key = "${var.key_path}"
    }

    provisioner "remote-exec" {
        inline = [
            "echo ${var.primary_consul} > /tmp/consul-server-addr",
        ]
    }

    provisioner "remote-exec" {
        scripts = [
            "${path.module}/scripts/install.sh"
        ]
    }

    provisioner "remote-exec" {
        inline = [
            "sudo systemctl enable consul.service",
            "sudo systemctl start consul"
        ]
    }
    provisioner "remote-exec" {
        inline = [
            "sudo systemctl enable consul-template.service",
            "sudo systemctl start consul-template"
        ]
    }

}
