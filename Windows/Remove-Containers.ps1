docker ps -a |% { $id = $_.split(" ")[0]; docker stop $id; docker rm $id; }
