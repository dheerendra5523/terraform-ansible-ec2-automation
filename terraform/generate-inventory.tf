locals {
  inventory = { for name, inst in aws_instance.servers : name => {
    public_ip = inst.public_ip
    user      = var.instances[name].user
    os_family = var.instances[name].os_family
  } }

  ubuntu_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "Ubuntu" }
  amazon_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "Amazon Linux" }
  redhat_hosts = { for name, inst in local.inventory : name => inst if inst.os_family == "Red Hat" }
  master_hosts = { for name, inst in local.inventory : name => inst if can(regex("control-node-ubuntu", name)) }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/templates/inventory.tpl", {
    ssh_key_path = var.ssh_key_path
    ubuntu       = local.ubuntu_hosts
    redhat       = local.redhat_hosts
    amazon       = local.amazon_hosts
    master       = local.master_hosts
  })
  filename        = "${path.module}/../inventories/dev/hosts.ini"
  file_permission = "0644"

}