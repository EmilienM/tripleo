#!/bin/bash

set -ux

openstack router remove subnet default-router private-subnet
openstack router delete default-router
openstack network delete private
openstack network delete public
