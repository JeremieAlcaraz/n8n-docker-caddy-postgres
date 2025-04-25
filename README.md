# n8n-docker-caddy-postgres
This guide will help you set up n8n with Caddy and Postgres 14.

## Quick Setup

### Add the docker group (if needed)

```bash
sudo usermod -aG docker ubuntu

newgrp docker
```

### Edit the env file

- [ ] `.env`

### Start the containers

```bash
docker compose up -d
```

---

## 1. Connect to your VPS via SSH

```bash
ssh ubuntu@your_vps_ip
```

---

## 2. Install Git (if needed) and Docker

If Git is not installed:

```bash
sudo apt update
sudo apt install git
```

To install Docker:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

---

## 3. Clone this repo and generate the .env file

This [repo](https://github.com/JeremieAlcaraz/n8n-docker-caddy-postgres) contains a `docker-compose.yml` with n8n, Caddy, and Postgres (perfect for us!).

```bash
git clone https://github.com/JeremieAlcaraz/n8n-docker-caddy-postgres.git
cd n8n-docker-caddy-postgres
```

Make the `gen-env.sh` script executable and run it:

```bash
chmod +x gen-env.sh
./gen-env.sh
```

## 4. Retrieve the IP address and point your subdomain to it

```bash
curl -s https://ipinfo.io/ip
```

Create a subdomain in your DNS registrar and point it to your VPS's public IP address.

## 5. Update the .env file

Fill in or update the variables in the `.env` file with your information.

## 6. Start the stack

```bash
docker compose up -d
```

