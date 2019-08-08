#!/bin/bash

while true; do
    echo "sub topic.live_lyric"|nc localhost 23334
    echo
    sleep 1
done
