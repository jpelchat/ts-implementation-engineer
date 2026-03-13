# Overview

These Terraform configuration files will deploy two droplets (VMs) into DigitalOcean:

- One droplet to act as a Tailscale subnet router
- Another to act as a client reachable via said subnet router

I opted for DigitalOcean because it is a simple cloud provider and Terraform provides a stable and reproducible mechanism to create this environment.

# Future improvements

- The current method of running `tailscale up` in the `user_data` script causes the Tailscale auth key to be visible in plaintext in the resulting 

# Prerequisites 

You will need the following before beginning:

- A DigitalOcean access token with permission to create droplets
- A Tailscale auth key
- A device with Terraform installed and that is connected to your tailet

# Usage

1. Initialize Terraform.

```
terraform init
```

2. Plan your deployment and confirm Terraform intends on creating two resources. 

```
terraform plan
```

3. Apply the configuration, passing your DigitalOcean access token and Tailscale auth key as variables.

```
terraform apply -var="do_token=<DO_TOKEN>" -var="ts_auth_key=<TS_AUTH_KEY>"
```

4. Within Tailscale, adjust your ACL to grant access to the `default-tor1` VPC and ensure the subnet router is auto-approved to advertise the VPC.

```
    "grants": [
		{
			"src": ["*"],
			"dst": ["10.118.0.0/20"],
			"ip":  ["*"],
		},
	],

	"autoApprovers": {
		"routes": {
			"10.118.0.0/20": ["autogroup:admin"],
		},
	},
```

# Testing

1. Output the private IP address of the `client` VM.

```
terraform output
```

2. Traceroute to the private IP, and confirm it goes via the subnet router.

```
traceroute <INSERT_IP>
```

# LLM usage

Claude was used to generate some of the Terraform configuration in this repository. This was done for efficiency purposes. 