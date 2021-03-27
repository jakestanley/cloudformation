# Counter Strike: Global Offensive

## Server token

App ID: 740

You will need a "Steam Game Server Account Management" token which can be obtained [here](https://steamcommunity.com/dev/managegameservers) (login required)

## Installing

- Log in with `ubuntu@<instance-ip> -i ~/.ssh/Linkup.pem`

```
#!/bin/bash
sudo add-apt-repository multiverse
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install lib32gcc1 steamcmd

# create and switch to steam user
sudo useradd -m steam -s /bin/bash
sudo su steam
cd

# log in and download
steamcmd \
    +login anonymous \
    +force_install_dir ./cs_go/ \
    +app_update 740 validate \
    +quit
```

## Starting the server

- Log in with `ubuntu@<instance-ip> -i ~/.ssh/Linkup.pem`

```
sudo su steam
cd ~/.steam/steamcmd/cs_go
export GSLT=YOUR_STEAM_GAME_SERVER_TOKEN
```

I recommend running the game server under screen so you can re-attach if you lose SSH connection

## Parameters

https://csgo-ranks.com/launch-commands/

## Game modes

Scoutsman:
```
./srcds_run -game csgo -console -usercon \
    +game_type 5 \
    +game_mode 0 \
    +map ar_dizzy \
    +sv_skirmish_id 3 \
    +sv_setsteamaccount $GSLT \
    +sv_password <server-password>
```

Arms race:
```
./srcds_run -game csgo -console -usercon \
    +game_type 1 \
    +game_mode 0 \
    +mapgroup mg_armsrace \
    +map ar_shoots \
    +sv_setsteamaccount $GSLT \
    +sv_password <server-password>
```

Deathmatch
```
./srcds_run -game csgo -console -usercon \
    +game_type 1 \
    +game_mode 2 \
    +mapgroup mg_allclassic \
    +map de_dust \
    +sv_setsteamaccount $GSLT \
    +sv_password <server-password>
```

## Joining the server

Enter into the CSGO console
```
password <server-password>
connect <server-ip>
```