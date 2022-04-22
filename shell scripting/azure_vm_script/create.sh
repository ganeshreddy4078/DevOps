#!/bin/bash
az group create --name ansible_rg \
                --location eastus \
                --subscription Pay-As-You-Go

az network vnet create -n aks-rg1-vnet \
                       -g ansible_rg \
                       --address-prefix 10.0.0.0/16 \
                       --subnet-name aks-rg1-snet \
                       --subnet-prefix 10.0.0.0/24

az vm create -n ansible_jumpbox -g ansible_rg --vnet-name aks-rg1-vnet --size Standard_D2s_v3 --vnet-address-prefix 10.0.0.0/16 --subnet aks-rg1-snet --subnet-address-prefix 10.0.0.0/24 --admin-username ganesh123 --admin-password Password12345! --public-ip-address ansible_jumpbox_pip --public-ip-address-allocation dynamic --image UbuntuLTS --os-disk-size-gb 30 --os-disk-name ansible_jumpbox_osdisk

az vm create -n ubuntu_slave -g ansible_rg --vnet-name aks-rg1-vnet --size Standard_D2s_v3 --vnet-address-prefix 10.0.0.0/16 --subnet aks-rg1-snet --subnet-address-prefix 10.0.0.0/24 --admin-username bhadra123 --admin-password Password12345! --public-ip-address ubuntu_slave_pip --public-ip-address-allocation dynamic --image UbuntuLTS --os-disk-size-gb 30 --os-disk-name ubuntu_slave_osdisk

az vm create -n redhat_slave -g ansible_rg --vnet-name aks-rg1-vnet --size Standard_D2s_v3 --vnet-address-prefix 10.0.0.0/16 --subnet aks-rg1-snet --subnet-address-prefix 10.0.0.0/24 --admin-username bhadra123 --admin-password Password12345! --public-ip-address redhat_slave_pip --public-ip-address-allocation dynamic --image RedHat:RHEL:7-RAW:7.4.2018010506 --os-disk-size-gb 32 --os-disk-name redhat_slave_osdisk
