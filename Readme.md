# Coder

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
* user_gid = 1001
* user_id  = 1001

If you build it on the system where it will be used and volumes comes from that system you can do:

```bash
docker build -t coder --build-arg user_id=$UID --build-arg user_gid=$GID .
```

## Run with your own SSL certificate
Default configuration always run coder with self-signed certificate.

If you have your own certificate you can easily setup it.

Run container with mounted volume where will be your certificate and key and override entrypoint like that:
```bash
docker run --name coder -it -v PATH_ON_LOCAL_FILESYSTEM:/home/coder/certs --entrypoint='' coder  pkalemba/coder-server --cert=/home/coder/certs/cert_file_name.crt --cert-key=/home/coder/certs/key_filename.key DIRECTORY_IN_CONTAINER_WITH_CODE

