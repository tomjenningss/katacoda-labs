#!/bin/bash

echo "export JAVA_HOME=/usr" >> ~/.profile;
touch test.txt
git clone https://github.com/openliberty/guide-getting-started.git

docker pull open-liberty:latest

