#!/bin/bash

ls -l
export PATH=$PATH:~/node-v8.5.0-linux-x64/bin

mkdir -p "/tmp/Testude 365/agent"

java -jar "$pwd/agent/versions/1.0.0/pc-agent.jar" "$pwd/agent" "/tmp/Testude 365/agent" "1.0.0" "https://www.testude365.com:8081" "https://www.testude365.com:8082/v1" 0
