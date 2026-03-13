output "droplet_sr_ip" {
  value       = digitalocean_droplet.subnet_router.ipv4_address
  description = "Public IP of jacob-subnet-router-1"
}

output "droplet_client_ip" {
  value       = digitalocean_droplet.client.ipv4_address_private
  description = "Private IP of jacob-client-1"
}