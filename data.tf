data "digitalocean_ssh_key" "jacob_work_mac" {
  name = "jacob-work-mac"
}

data "digitalocean_vpc" "default_tor1" {
  name = "default-tor1"
}