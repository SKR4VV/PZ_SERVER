# Easy PZ Server Hosting

Docker stack for hosting a non-steam Project Zomboid server.

## Getting Started

### Prerequisites

You need docker and docker compose to run this project.
Follow the official documentation [here](https://docs.docker.com/get-started/get-docker/).

### Installation

Create your own ```.env``` file based on the example & create an ```admin_password``` file at project root with your password in it.

Simply run :

```sh
docker compose -d up
```

It will create a default configuration files to initialize the server. If you don't want to use them, paste yours or use files from ```server_config_example``` in ```config > Server```

Don't forget to rename "servername" with the name previously defined in the ```.env``` (SERVER_NAME) in order to use the example config.

For external access, make 16261 and 16262 ports available.

Enjoy the game on your fresh server !

## Roadmap

* Separate server installation from execution
* Check for an update and write it to the game chat variable
* Add support for mods
* Support command execution via Discord


## Sources

[pz wiki](https://pzwiki.net/wiki/Dedicated_server) \
[steamcmd wiki](https://developer.valvesoftware.com/wiki/SteamCMD) \
[steamdb info](https://steamdb.info/app/380870/info/)