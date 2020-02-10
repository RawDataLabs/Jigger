#!/bin/bash


echo "Uninstalling Jigger Operator..."
echo "Deleting CRDS:"
kubectl delete -f ./deploy/crds/cache_v1alpha1_pvcmigration_crd.yaml
kubectl delete -f ./deploy/crds/cache_v1alpha1_postgresqlmigration_crd.yaml
kubectl delete -f ./deploy/crds/cache_v1alpha1_externalroute_crd.yaml

echo "Deleting Deployment Resources:"
sleep 3
kubectl delete deployment jigger-operator 

echo "Deleting Operator Resources:"
kubectl delete -f ./deploy/service_account.yaml
kubectl delete -f ./deploy/role.yaml
kubectl delete -f ./deploy/role_binding.yaml
kubectl delete -f ./deploy/cluster_role.yaml
kubectl delete -f ./deploy/cluster_role_binding.yaml
kubectl delete -f ./deploy/operator.yaml

echo "Finished"
