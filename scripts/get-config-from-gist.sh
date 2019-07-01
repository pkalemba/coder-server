#!/bin/bash

gistid="pkalemba/f0951649724924b1b4a7a5d9efac5887"
gisturl="https://gist.githubusercontent.com/${gistid}/raw"

curl -o ../extensions.json "${gisturl}/extensions.json"
curl -o ../settings.json "${gisturl}/settings.json"
