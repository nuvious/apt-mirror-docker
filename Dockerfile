FROM debian:stable-slim

# Upgrade the system (vulnerability reduction)
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove --purge -y

# Install apt-mirror components and cron
RUN apt-get install apt-mirror gnupg xz-utils cron -y
COPY apt-mirror.cron /etc/cron.d/apt-mirror

# Run apt-mirror; default directory will be /var/spool/apt-mirror/data for data
CMD ["/usr/bin/apt-mirror"]
