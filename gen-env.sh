#!/bin/bash

# Ce script génère automatiquement un .env robuste

CURRENT_DIR="$(pwd)"

cat > .env <<EOF
# 📁 Chemin absolu vers le dossier de données
DATA_FOLDER=${CURRENT_DIR}/n8n-docker-caddy-postgres

# 🌐 Configuration domaine
DOMAIN_NAME=example.com
SUBDOMAIN=n8n

# 🌍 Fuseau horaire
GENERIC_TIMEZONE=Europe/Berlin

# 📧 Email pour le SSL
SSL_EMAIL=example@example.com

# 🐘 Postgres
POSTGRES_USER=rootuser
POSTGRES_PASSWORD=rootpass
POSTGRES_DB=n8n
POSTGRES_NON_ROOT_USER=n8nuser
POSTGRES_NON_ROOT_PASSWORD=n8npass
EOF

echo ".env généré avec succès ✅"

