#!/bin/bash
set -e

# Créer l'utilisateur non-root pour n8n et Guacamole
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER $POSTGRES_NON_ROOT_USER WITH PASSWORD '$POSTGRES_NON_ROOT_PASSWORD';
    GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB TO $POSTGRES_NON_ROOT_USER;
EOSQL

# Créer une base de données spécifique pour Guacamole si nécessaire
if [ -n "$GUAC_DB" ]; then
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
        CREATE DATABASE $GUAC_DB;
        GRANT ALL PRIVILEGES ON DATABASE $GUAC_DB TO $POSTGRES_NON_ROOT_USER;
    EOSQL
    
    # Télécharger et exécuter le script d'initialisation de Guacamole
    wget -O /tmp/initdb.sql https://raw.githubusercontent.com/apache/guacamole-client/1.5.5/extensions/guacamole-auth-jdbc/modules/guacamole-auth-jdbc-postgresql/schema/upgrade/upgrade-pre-1.5.5.sql
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$GUAC_DB" -f /tmp/initdb.sql
fi