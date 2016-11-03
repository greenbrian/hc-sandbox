output "consul_addresses" {
  value = ["${module.consul-vault.consul_addresses}"]
}

output "consul_ui" {
    value = "${module.consul-vault.consul_ui}"
}

output "nginx_addresses" {
    value = "${module.nginx.nginx_addresses}"
}

output "haproxy_address" {
    value = "${module.haproxy.haproxy_address}"
}

output "haproxy_stats" {
    value = "${module.haproxy.haproxy_stats}"
}

output "haproxy_web_frontend" {
    value = "${module.haproxy.haproxy_web_frontend}"
}
