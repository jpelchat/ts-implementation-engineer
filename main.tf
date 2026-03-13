resource "digitalocean_droplet" "subnet_router" {
  name   = "jacob-subnet-router-1"
  region = "tor1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-24-04-x64"
  vpc_uuid = data.digitalocean_vpc.default_tor1.id

  user_data = <<-EOF
    #!/bin/bash
    curl -fsSL https://tailscale.com/install.sh | sh
    tailscale up --authkey="${var.ts_auth_key}" --advertise-routes="10.118.0.0/20" --ssh
EOF

  ssh_keys = [
    data.digitalocean_ssh_key.jacob_work_mac.id
  ]
}
resource "digitalocean_droplet" "client" {
  name   = "jacob-client-1"
  region = "tor1"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-24-04-x64"
  vpc_uuid = data.digitalocean_vpc.default_tor1.id

  ssh_keys = [
    data.digitalocean_ssh_key.jacob_work_mac.id
  ]
}