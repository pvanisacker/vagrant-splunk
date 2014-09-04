#!/bin/bash

while [[ true ]]; do
	curl "http://localhost/index.html" -o /dev/null
	sleep_time=$(( ( RANDOM % 30 ) + 1 ))
	sleep $sleep_time
done
