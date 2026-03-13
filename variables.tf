variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "ts_auth_key" {
  description = "Tailscale auth key"
  type        = string
  sensitive   = true
}