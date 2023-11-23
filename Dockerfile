FROM nginx:bookworm

# Upgrade the system (vulnerability reduction)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove --purge -y

# Install apt-mirror components and cron
RUN apt-get install apt-mirror gnupg xz-utils cron -y

# Enable cron updates
COPY apt-mirror.cron /etc/cron.d/apt-mirror

# Link apt-mirror data directory to /var/www/html
RUN rm -rf /var/www/html
RUN mkdir -p /var/spool/apt-mirror/data /var/www && \
    ln -s /var/spool/apt-mirror/data /var/www/html
