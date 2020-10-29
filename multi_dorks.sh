#!/bin/bash

while read args; do
./dorks.sh $args
done

telegram -M "*Finish*"
