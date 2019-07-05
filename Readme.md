# Coder

Development environment which allows edit files on remote servers by the browser.

## Quick start
You need to have docker installed.

Than go to directory with your files and run:
```bash
docker run -v $PWD:/home/coder/project pkalemba/coder-server
```
Server will listening on 0.0.0.0:8443 and docker expose port 8443, so open it on firewall or redirect to other port using -p switch in docker run.
Copy password from 
## Setup Settings Sync

Coder project is using [Settings Sync plugin by shanalikhan](https://github.com/shanalikhan/code-settings-sync) which is using Github GIST.

If you have your envrionment synced to gist you can use ```GIST_ID``` and ```GIST_TOKEN``` variables on docker run.

Example:
```bash
docker run -e GIST_ID=f0951649724924b1b4a7a5d9efac -e GIST_TOKEN=4c4712a4141d261ec0ca8f9037950685 pkalemba/coder-server
```

## Setup UID and GID

Make image with specific UID and GID for user inside image to avoid problems with mounted volumes and rights of files

To change UID and GID for docker image it need to be build again with new values.

Default values are:
* user_gid = 1000
* user_uid  = 1000

If you build it on the system where it will be used and volumes comes from that system you can do:

```bash
docker build -t coder --build-arg user_uid=$UID --build-arg user_gid=`id -g` .
```

## Run with your own SSL certificate
Default configuration always run coder with self-signed certificate.

If you have your own certificate you can easily setup it.

Run container with mounted volume where will be your certificate and key and override entrypoint like that:
```bash
docker run --name coder -it -v PATH_ON_LOCAL_FILESYSTEM:/home/coder/certs --entrypoint='' pkalemba/coder-server --cert=/home/coder/certs/cert_file_name.crt --cert-key=/home/coder/certs/key_filename.key DIRECTORY_IN_CONTAINER_WITH_CODE
```

## Use environments
In directory environments are Dockerfiles prepared for some environments like python or golang. You can also build you own using the same convention. Every environment Dockerfile as a base uses latest Base coder-server image from docker hub. Always you can change that if you build base image locally.
All environments from directory are also build and can be used directly from docker hub. Name of the directory of environment is also tag for image so for example:
```
./environments/python3 -> pkalemba/coder-server:python3
```

