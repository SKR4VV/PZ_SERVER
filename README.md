# Easy PZ Server Hosting

Docker stack for hosting a non-steam Project Zomboid server.

## Getting Started

### Prerequisites

You need docker and docker compose to run this project.
Follow the official documentation [here](https://docs.docker.com/get-started/get-docker/).

### Installation

First, you need to create the Steam ```.env``` in ```steam_config``` folder and put the STEAMAPPID of the game (Project Zomboid server is 380870).

Then, create the server ```.env``` file based on the example and create an ```admin_password``` file at project root with your password in it.

To run the server with your own settings, set CUSTOM_CONFIG to true and replace the four configuration files in ```custom_config``` folder or just edit theses files :

```
servername_SandboxVars.lua
servername_spawnpoints.lua
servername_spawnregions.lua
servername.ini
```

If CUSTOM_CONFIG is set to false, it will create a default configuration files to initialize the server.

Now, run the following command.

```sh
docker compose --profile updater up
```

The Steam container will download the server binaries from the Steam repository and the game container will launch the server after that.

Next time you need to run the server, disable CUSTOM_CONFIG and run this command :

```sh
docker compose up
```

Finaly, for external access, make 16261 and 16262 ports available.

Enjoy the game on your fresh server !

## Roadmap

* Check for an update and write it to the game chat variable
* Create public Steam server
* Add support for multiple servers
* Add support for mods
* Add support for command execution with Discord

## Sources

[pz wiki](https://pzwiki.net/wiki/Dedicated_server) \
[steamcmd wiki](https://developer.valvesoftware.com/wiki/SteamCMD) \
[steamdb info](https://steamdb.info/app/380870/info/)