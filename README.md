# WebDSL Dockerized Apps

For running WebDSL applications inside a Docker Container

## Setup

Copy the source code of the WebDSL application to `src/`

## Running the app

1. Build the Docker container: 

```zsh
docker build . -t webdsl-app --build-arg app_name=<my-webdsl-app> # replace <my-webdsl-app>
```

2. Run the Docker container:

```zsh
docker run -it --name webdsl-app -p 8081:8080 webdsl-app
```

## Reindexing

```zsh
docker exec -u root -it wpl /bin/sh -c 'cd /usr/local/tomcat/webapps/<my-webdsl-app> ; sh ./webdsl-reindex' # replace <my-webdsl-app>
```

Press enter if it prompts you for amount of memory.
