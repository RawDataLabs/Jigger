#!/bin/bash

# replace NAMESPACE  
NAMESPACE=$(oc project rawdata)

echo "Creating CRDS"
oc create -f ./deploy/crds/cache_v1alpha1_pvcmigration_crd.yaml
oc create -f ./deploy/crds/cache_v1alpha1_postgresqlmigration_crd.yaml
oc create -f ./deploy/crds/cache_v1alpha1_externalroute_crd.yaml
# oc create -f ./deploy/crds/cache_v1alpha1_mongodbmigration_crd.yaml

sleep 1

echo "Creating Operator Resources"
oc create -f ./deploy/service_account.yaml
oc create -f ./deploy/role.yaml
oc create -f ./deploy/role_binding.yaml
oc create -f ./deploy/cluster_role.yaml
oc create -f ./deploy/cluster_role_binding.yaml
oc create -f ./deploy/operator.yaml

echo "Creating Operator RBAC"

# oc adm policy add-role-to-user admin jigger-operator -n ${NAMESPACE}
# oc adm policy add-cluster-role-to-user admin jigger-operator
# oc adm policy add-cluster-role-to-user cluster-admin jigger-operator 

echo "Exit"
