#!/bin/bash

echo "Deleting ansible_rg"

az group delete --name ansible_rg --yes --no-wait
