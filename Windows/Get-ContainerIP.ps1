param (
    $Container
)
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $Container
