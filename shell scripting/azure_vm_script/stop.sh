# You can Stop the Azure VM using below cmdlet
az vm stop --resource-group test_rg --name ubuntu_workernode
#we have to deallocate because, even if we stopped VM it still get charged and we have to pay
# You can Deallocate Azure VM using the below cmdlet
az vm deallocate --resource-group test_rg --name ubuntu_workernode

