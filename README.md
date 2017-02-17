# PufferPanel

PufferPanel for Minecraft in a Box.

http://www.pufferpanel.com

```
docker run -d \
    -p 80:80 \
    -p 25565:25565 \
    -p 5657:5657 \
    -e VIRTUAL_HOST=<your host> \
    --name pufferpanel killergoldfisch/pufferpanel
```

The default User is:

```
ADMIN_NAME root
ADMIN_PW toor
ADMIN_EMAIL root@localhost.net
```

Please change your Password immediately!
