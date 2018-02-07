#!/bin/bash

set -eux

sed -i s/192.168.24.1/192.168.122.1/g instackenv.json

jq '.["nodes"][] | "vbmc add --username " + ."pm_user" + " --password " + ."pm_password" + " --port " + ."pm_port" + " --address " + ."pm_addr" + " --libvirt-uri qemu:///system " + (."name"|sub("-";"_"))' instackenv.json -r

set +x
for node in $(vbmc list | grep down | awk '{print $2}'); do
  echo vbmc start $node
done