docker images --all --quiet |% { docker rmi $_ --force; }
