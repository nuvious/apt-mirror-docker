# Yet another apt-mirror container

[![Publish Docker image](https://github.com/nuvious/apt-mirror-docker/actions/workflows/build-container.yaml/badge.svg)](https://github.com/nuvious/apt-mirror-docker/actions/workflows/build-container.yaml)

## Docker Usage

```bash
docker run -d \
    -v /path/to/repo/data/store:/var/spool/apt-mirror \
    -v /path/to/mirror.list:/etc/apt/mirror.list \
    nuvious/apt-mirror:latest
```

## Example mirror.list

**NOTE**: The container is configured to use a symbolic link from `/var/spool/apt-mirror/data` to `/var/www/html`.
The `base_path` and `mirror_path` therefore should not be changed, but other paths can be modified. You want to mount
your volume to `/var/spool/apt-mirror` using a default configuration below. Other configurations are possible in
docker-compose if one modifies the entrypoint and/or command to update the directory structure to their liking.

```plaintext
set base_path         /var/spool/apt-mirror
set mirror_path       $base_path/data
set skel_path         $base_path/skel
set var_path          $base_path/var
set postmirror_script $var_path/postmirror.sh
set defaultarch       amd64
set run_postmirror    0
set nthreads          6
set limit_rate        100m
set _tilde            0
set unlink            1
set use_proxy         off
set http_proxy        127.0.0.1:3128
set proxy_user        user
set proxy_password    password
deb http://deb.debian.org/debian bookworm main contrib non-free
deb-src http://deb.debian.org/debian bookworm main contrib non-free
deb http://security.debian.org/debian-security bookworm-security main contrib non-free
deb-src http://security.debian.org/debian-security bookworm-security main contrib non-free
deb http://deb.debian.org/debian bookworm-updates main
deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free
deb http://deb.debian.org/debian bookworm-backports main
deb-src http://deb.debian.org/debian bookworm-backports main contrib non-free
```
