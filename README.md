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


---

## 1. Se connecter en ssh à son VPS

---

## 2. Installer git (si besoin) et docker

Si besoin d’installer git : 

```yaml
sudo apt update
sudo apt install git
```

Pour installer docker : 

```yaml
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
```

---

## 3. Cloner ce repo et générer le .env

Ce [repo](https://github.com/JeremieAlcaraz/n8n-docker-caddy-postgres) contient un docker-compose.yml avec n8n, caddy et postgre (parfait pour nous !)

```yaml
git clone https://github.com/JeremieAlcaraz/n8n-docker-caddy-postgres.git
```

```notion
cd n8n-docker-caddy-postgres
```

```notion
# rends le script gen-env.sh exécutable
chmod +x gen-env.sh

# exécute-le
./gen-env.sh
```

## 4. Récupérer l’IP et faire pointer le sous-domaine vers l’IP

```notion
curl -s https://ipinfo.io/ip
```

Créer un sous-domaine sur le register et faire pointer vers l’IP publique du VPS

## 5. MàJ .env

Mettre les infos à jour dans le .env

## 6. Démarrer la stack

```notion
docker compose up -d
```