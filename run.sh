#!/bin/bash

docker container run --rm -e TAGS=$@ test-ansible
