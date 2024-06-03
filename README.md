# dosboxgames in docker

Docker image of DOSBox running on js-dos

Requires you to provide your own DosBox capable games in a GAMES.zip file and a MENU.BAT file. Sample batch file provided.

```bash
GAME_ARGS=\"MENU.BAT\"
docker build \
  --build-arg GAME_ARGS=$GAME_ARGS \
  -t dosboxgames .
```

once you have built the image, run with

`docker run -d -p 8000:8000 dosboxgames`

## Examples

### MENU.BAT

```
@echo off
cls
echo ############ GAMES COLLECTION ############
echo # A. Gateway            B. SimCity       #
echo ##########################################
echo #                                        #
echo ##########################################
echo #######  PLEASE MAKE A SELECTION  ########
echo ##########################################
CHOICE /C:AB /N

if ERRORLEVEL == 2 goto SimCity
if ERRORLEVEL == 1 goto Gateway

:Gateway
cd GATEWAY
GATE.exe
goto end

:SimCity
cd SIMCITY
SIMCITY.exe
goto end

:end
cd..
MENU.bat

:quit
cls
```

### docker-compose.yml

```yml
version: "3"

services: 
  dosboxgames:
    image: baustin1981/dosboxgames:beta1
    container_name: dosboxgames
    environment:
      GAME_ARGS: \"MENU.bat\"
    volumes:
      - ./dosboxgames/GAMES.zip:/site/game.zip
    ports:
      - 8081:8000
    restart: unless-stopped
```