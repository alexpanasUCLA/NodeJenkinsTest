#!/bin/bash
sed "s/latest/$1/g" pod-simple.yaml > pod-simple-updated.yaml
