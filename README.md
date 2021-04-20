# WebDSL Dockerized Apps

For running WebDSL applications inside a Docker Container

## Setup

Copy the source code of the WebDSL application to `src/`

## Running the app

```bash
./run.sh <name-of-main-file>
# Example: ./run.sh GamePanel
```

After the Docker image is built and the container has started, the app should be available at `localhost:8081/<name-of-main-file>`.

## Reindexing

```bash
./reindex.sh <name-of-main-file>
# Example: ./reindex.sh GamePanel
```

Press enter if it prompts you for amount of memory.
