#!/bin/sh
PS3='Please select the target container: '

# Get container names
CNAMES=(`docker ps --format "{{.Names}}"`)
# Select interface
select cname in "${CNAMES[@]}"
do
  # Get container id
  CID=`docker ps -qf "name=$cname"`
  # Attach
  docker attach $CID
  break
done
exit 0
