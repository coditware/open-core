# Keycloak docker compose/swarm guide

## Setting the environment variables

Create a file containing the required variables in a secrets.env file. Refer to keycloak's [docker hub page](https://hub.docker.com/r/jboss/keycloak/) for the required variables.

If using the docker image for Keycloak 3.4.3 or older, use the "Deprecated" variables. Official instructions to use postgresql with keycloak's docker image 3.4.3 is incorrect. The actual variable that would be required is `POSTGRES_PORT_5432_TCP_ADDR`, rather than just POSTGRES_PORT as specified on the docker hub page.

## Configuration for reverse proxy

Forwarding requests to keycloak requires the environment variable `PROXY_ADDRESS_FORWARDING` to be set to true.

## Example secrets.env file

``` environment
# secrets.env
PROXY_ADDRESS_FORWARDING=true

KEYCLOAK_USER=email
KEYCLOAK_PASSWORD=password

DB_VENDOR=POSTGRES
DB_ADDR=db
DB_PORT=5432

DB_USER=me
DB_DATABASE=keycloak
DB_PASSWORD=password
```

## Example configuration for nginx proxy

``` nginx
server {
    listen 80;
    server_name auth.myapp;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443;
    server_name auth.myapp;

    ssl_certificate /etc/nginx/certs/project-keycloak.crt;
    ssl_certificate_key /etc/nginx/certs/project-keycloak.key;

    ssl on;
    ssl_protocols TLSv1.2;

    location / {
        proxy_pass http://auth:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```
