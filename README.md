# Docker container for Portfolio Performance
## Summary
This is a Docker container for [Portfolio Performance](https://www.portfolio-performance.info/en/).

The GUI of the application is accessed through a modern web browser (no installation or configuration needed on the client side) or via any VNC client.

This container is using [jlesage/baseimage-gui](https://hub.docker.com/r/jlesage/baseimage-gui) as baseimage.

## Mount
You have to mount /opt/portfolio/workspace to be able to get access or upload your Portfolio Performance files.

## Environment Variables
The following public environment variables are provided by the baseimage:

| Variable       | Description                                  | Default |
|----------------|----------------------------------------------|---------|
|`USER_ID`| ID of the user the application runs as. | `1000` |
|`GROUP_ID`| ID of the group the application runs as. | `1000` |
|`TZ`| [TimeZone](http://en.wikipedia.org/wiki/List_of_tz_database_time_zones) used by the container.  Timezone can also be set by mapping `/etc/localtime` between the host and the container. | `Etc/UTC` |
|`DISPLAY_WIDTH`| Width (in pixels) of the application's window. | `1920` |
|`DISPLAY_HEIGHT`| Height (in pixels) of the application's window. | `1080` |
|`WEB_LISTENING_PORT`| Port used by the web server to serve the UI of the application.  This port is used internally by the container and it is usually not required to be changed.  By default, a container is created with the default bridge network, meaning that, to be accessible, each internal container port must be mapped to an external port (using the `-p` or `--publish` argument).  However, if the container is created with another network type, changing the port used by the container might be useful to prevent conflict with other services/containers.  **NOTE**: a value of `-1` disables listening, meaning that the application's UI won't be accessible over HTTP/HTTPs. | `5800` |
|`VNC_LISTENING_PORT`| Port used by the VNC server to serve the UI of the application.  This port is used internally by the container and it is usually not required to be changed.  By default, a container is created with the default bridge network, meaning that, to be accessible, each internal container port must be mapped to an external port (using the `-p` or `--publish` argument).  However, if the container is created with another network type, changing the port used by the container might be useful to prevent conflict with other services/containers.  **NOTE**: a value of `-1` disables listening, meaning that the application's UI won't be accessible over VNC. | `5900` |
|`VNC_PASSWORD`| Password needed to connect to the application's GUI.  See the [VNC Password](#vnc-password) section for more details. | `""` |

## Docker Compose Example
```yaml
version: "3"
services:
  portfolio:
    build: .
    container_name: portfolio
    restart: unless-stopped
    ports:
      - 5800:5800
    volumes:
      - /mnt/portfolio:/opt/portfolio/workspace
    environment:
      USER_ID: 0
      GROUP_ID: 0
      TZ: "Europe/Berlin"
