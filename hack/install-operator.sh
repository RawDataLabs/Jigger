#!/bin/bash

set -e


echo "Installing Jigger Operator..."
echo "Creating CRDS:"
kubectl create -f ./deploy/crds/cache_v1alpha1_pvcmigration_crd.yaml
kubectl create -f ./deploy/crds/cache_v1alpha1_postgresqlmigration_crd.yaml
kubectl create -f ./deploy/crds/cache_v1alpha1_externalroute_crd.yaml

echo "Creating Operator Resources:"
kubectl create -f ./deploy/service_account.yaml
kubectl create -f ./deploy/role.yaml
kubectl create -f ./deploy/role_binding.yaml
kubectl create -f ./deploy/cluster_role.yaml
kubectl create -f ./deploy/cluster_role_binding.yaml
kubectl create -f ./deploy/operator.yaml

echo "Finished"
