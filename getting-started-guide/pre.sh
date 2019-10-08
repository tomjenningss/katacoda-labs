#!/bin/bash

git clone https://github.com/openliberty/guide-getting-started.git
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/jre/bin:$PATH
cd guide-getting-started
docker pull open-liberty:latest