app="$1"
tag=$(echo "$app" | tr '[:upper:]' '[:lower:]')

docker exec -u root -it "$tag" /bin/sh -c "cd /usr/local/tomcat/webapps/$app ; sh ./webdsl-reindex"

