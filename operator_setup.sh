#!/bin/bash

# replace NAMESPACE  
NAMESPACE=$(oc project demo)

echo "Creating CRDS"
oc create -f ./deploy/crds/cache_v1alpha1_pvcmigration_cr.yaml
oc create -f ./deploy/crds/cache_v1alpha1_postgresqlmigration_cr.yaml
oc create -f ./deploy/crds/cache_v1alpha1_mongodbmigration_cr.yaml


echo "Creating Operator Resources"
oc create -f ./deploy/service_account.yaml
oc create -f ./deploy/role.yaml
oc create -f ./deploy/role_binding.yaml
oc create -f ./deploy/cluster_role.yaml
oc create -f ./deploy/cluster_role_binding.yaml
oc create -f ./deploy/operator.yaml

echo "Creating Operator RBAC"

oc adm policy add-role-to-user admin jigger-operator -n ${NAMESPACE}
oc adm policy add-cluster-role-to-user admin jigger-operator
oc adm policy add-cluster-role-to-user cluster-admin jigger-operator 

echo "Exit"
