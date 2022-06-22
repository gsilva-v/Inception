#!/bin/bash

set -x

sudo docker rmi -f $(docker images -q --no-trunc)
