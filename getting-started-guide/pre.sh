#!/bin/bash

##mkdir newDir
export PATH=$JAVA_HOME/jre/bin:$PATH
git clone https://github.com/openliberty/guide-getting-started.git
cd guide-getting-started
##export JAVA_HOME=$(/usr/libexec/java_home)
##export PATH=$JAVA_HOME/jre/bin:$PATH

##mvn install liberty:run-server

docker pull open-liberty:latest