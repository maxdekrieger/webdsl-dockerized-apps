app="$1"
tag=$(echo "$app" | tr '[:upper:]' '[:lower:]')

docker build . -t "$tag" --build-arg app_name="$app"

docker run -it --name "$tag" -p 8081:8080 "$tag"

