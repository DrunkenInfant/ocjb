# openconnect jump box
openconnect & ssh daemon installed

## Build
```
docker build -t ocbj .
```

## Run
The container needs to be run with `-i` (interactive) in order to capture
stdin (password & OTP).

```
docker run --rm -it \
  --privileged \
  -p 2222:22 \
  -e SSH_AUTH_KEY="$(cat ~/.ssh/id_rsa.pub)" \
  -e VPN_HOST=https://vpn.example.com \
  ocbj
```

## Local forward

Once the container is running you can tunnel a local socket to a remote server which requires VPN.
For instance to forward `localhost:8999` to an address on the vpn `10.20.48.11:8080`:

```
ssh \
    -o "UserKnownHostsFile /dev/null" \
    -o "StrictHostKeyChecking no" \
    -nNT \
    -L 8999:172.22.51.20:8080 \
    -p 2222 \
    root@localhost
```

## Use the script

A helpful script is located in the container.

```
docker run --rm ocjb cat /ocjbh > /path/to/your/bin/ocjb
chmod +x /path/to/your/bin/ocjb
/path/to/your/bin/ocjb help
```
