# PostgreSQL docker-compose configuration

## Variables that need to be defined

```
    # In .env file
    POSTGRES_DB=database_name
```

```
    # In .variables file
    VENDOR="vendor name"
    CONTACT="an email"
    DESCRIPTION="Volume for PostgreSQL database"
    VOLUME_NAME="Name for postgres volume"

    NETWORK_NAME="network name to connect to postgres"
```

## Docker secrets that need to be defined
```
    mkdir .secrets
    echo db_user > .secrets/db.user
    echo db_password > .secrets/db.password
```
