FROM nginx:alpine

WORKDIR /etc/nginx/
ARG NGINX_DIR=/etc/nginx
RUN mkdir -p ${NGINX_DIR}/sites-enabled; \
    mkdir -p ${NGINX_DIR}/sites-available;

COPY ./nginx.conf ${NGINX_DIR}/
COPY ./sites-available ${NGINX_DIR}/sites-available
COPY ./sites-enabled ${NGINX_DIR}/sites-enabled

EXPOSE 80 443
