
# Docker Debian SSHdX11

## OverView

This Debian [`streach-slim`](https://hub.docker.com/layers/debian/library/debian/stretch-slim/images/sha256-3e6f082b2511516bb3f7f216d9611b837e1ce9891ef145c85cd5570b60170ed6) [Docker](https://docker.com/) container is made with [OpenSSH](https://www.openssh.com/) service to forward [`X11`](https://www.x.org/) windows.

## Usage

All that you need to do is to get this repo and run `run.sh` script, which build the image, create a container, and give you the ssh command and the password.

### Get the repo:

Get the repo using [`git`](https://git-scm.com/):

```bash
git clone https://github.com/Seven7Up/docker-debian-sshdx.git
```

Or as [tarball file](https://github.com/Seven7Up/docker-debian-sshdx/archive/master.tar.gz) or as [zip](https://github.com/Seven7Up/docker-debian-sshdx/archive/master.zip):

```bash
curl -LO https://github.com/Seven7Up/docker-debian-sshdx/archive/master.tar.gz

curl -LO https://github.com/Seven7Up/docker-debian-sshdx/archive/master.zip
```

### Build, Run, Read...

All this work is resumed in this command:

```bash
chmod +x run.sh
./run.sh
```
