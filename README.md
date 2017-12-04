## docker-amazonlinux-sshd

serve only one connection and will be shutdown after session closed.

build

```
$ docker build -t amazonlinux-sshd:latest .
```

run

```
$ docker run --rm -p 10022:22 -e ROOT_PW=password_to_login  -t amazonlinux-sshd:latest
```

## ENV

- `ROOT_PW`: password for root login (default: `rooooot`)
