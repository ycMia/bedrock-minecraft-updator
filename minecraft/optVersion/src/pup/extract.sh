#!/bin/bash 

node --no-warnings r.js | grep -oP 'bedrock-server-\K[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n 1

