# n8n-docker-caddy-postgres
This will help setup n8n with Caddy and Postgres 14

## Quick Setup
### Add docker grp

```
sudo usermod -aG docker ubuntu 

newgrp docker
```

### Edit files
- [ ] .env  
- [ ] caddy_config/Caddyfile  

### Start Containers
```
docker compose up -d
```
