#!/bin/bash
docker build -t khteh/mysql-slave .
docker push khteh/mysql-slave:latest
