#!/bin/bash

print_info(){
  printf "\n-----------------------------------------------------\n"
  echo -en $@
  printf "\n-----------------------------------------------------\n"
}

waitting_loop(){
  printf "Waiting for $1 seconds"
  for time_remairing in $(seq 1 $1); do
    sleep 1
    printf "."
  done
  printf "\n"
}

create_cont(){
  docker run -itd -p 2222:22 --name debian-sshdx-cont debian-sshdx /bin/bash 1>/dev/null 2>&1
}

docker images | grep debian-sshdx 1>/dev/null 2>&1
if [ "$(printf $?)" -ne "0" ]; then
  print_info "debian-sshdx not found!\nBuilding debian-sshdx..."
  docker build -t debian-sshdx .
fi

create_cont
if [ "$(printf $?)" -ne "0" ]; then
  print_info "Found a running container!\nRemoving debian-sshdx-cont..."
  docker rm debian-sshdx-cont
  create_cont
fi

# docker start debian-sshdx-cont
print_info "Running debian-sshdx on port 2222!"
waitting_loop 7

docker logs debian-sshdx-cont
