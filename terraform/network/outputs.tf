output "subnet_id" {
  value = "${aws_subnet.xlb.id}"
}

output "xlb_sg_id" {
  value = "${aws_security_group.xlb.id}"
}
