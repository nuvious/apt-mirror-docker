FROM debian:bullseye-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-mirror apache2 -y
RUN mkdir -p /deb-mirror /var/www/debian && ln -s /deb-mirror /var/www/debian

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
