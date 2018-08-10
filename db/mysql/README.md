# MySQL docker-compose configuration

## Variables that need to be defined

```
    # In .variables file
    VENDOR="vendor name"
    CONTACT="an email"
    DESCRIPTION="Volume for MySQL database"
    VOLUME_NAME="Name for mysql volume"
    NETWORK_NAME="network name to connect to mysql"
```

## Docker secrets that need to be defined
```
    mkdir .secrets
    echo db_user > .secrets/db.user
    echo db_password > .secrets/db.password
    echo db_name > .secrets/db.db_name
```
