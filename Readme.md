# Coder

## Setup UID and GID

Make image with specific UID and GID for user inside image to avoid problems with mounted volumes and rights of files
To change UID and GID for docker image it need to be build again with new values.
Default values are:
user_gid = 1001
user_id  = 1001
If you build it on the system where it will be used and volumes comes from that system you can do:

```bash
docker build -t coder --build-arg user_id=$UID --build-arg user_gid=$GID .
```
