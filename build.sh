#!/bin/bash
set -x

docker-compose --verbose build 
docker image ls

docker image push ${docker_repository}{docker_repo_path}{name}:${build_version}
docker image push ${docker_repository}{docker_repo_path}{name}:latest
docker image rm ${docker_repository}{docker_repo_path}{name}:${build_version}
docker image rm ${docker_repository}{docker_repo_path}{name}:latest
