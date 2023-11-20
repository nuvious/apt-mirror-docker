FROM debian:bookworm-slim

RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-mirror apache2 gnupg xz-utils -y
RUN rm -rf /var/www/html
RUN mkdir -p /var/spool/apt-mirror/data /var/www && \
    ln -s /var/spool/apt-mirror/data /var/www/html

WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
