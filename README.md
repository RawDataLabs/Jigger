### Jigger
jigger /ˈdʒɪɡə/ - Tested on OpenShift (v4.1, v3.11), this OpenShift Ansible Operator integrates multiple Certified RedHat Container Images acting as Database Clients and adds Migration Utility support for Databases deployed on OpenShift

Events are trigger by the corresponding CustomResources being created on the Cluster

## Supported Db Client Drivers:
  - PostgreSql
  - MongoDB
  - OpenShift PersistentVolumeClaims
  - @Todo OpenShift Reource Exports 
  - @Todo  Mysql
  - @Todo  Hazlecast
  - @Todo  Kafka
  - @Todo  Source Code Repositories (Git, GitLab)
  @Todo 

Transforming OpenShift CR (CustomResource) Events  in an Universal Database Migrator Operator 

[..]  Example CR

# PostgreSql Driver type:
/...



# MongoDB  Driver type:
/...



##  Installation

$ sh ./operator_setup.sh

$ oc create -f ./deploy/crds/cache_v1alpha1_pvcmigration_crd.yaml
