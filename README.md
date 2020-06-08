# Jigger Operator - cluster native Database Migration Tool 
jigger /ˈdʒɪɡə/ - Tested on OpenShift (v4.1, v3.11), the Jigger Operator integrates multiple Certified RedHat Container Images acting as Database Clients. 
Transforming CR's in a Database Migration Tool backed by a cluster aware ledger.
Create Data Transfer jobs and monitor the progress just as you would with any Kubernetes application.

### Features
Trying to achieve cluster native migration jobs easily for any databases deployed on Kubernetes.

Migration Jobs are trigger by the following CustomResources being created on the Cluster:
 **PvcMigration** , **PostgresqlMigration** 

### Supported Db Client Drivers:
  
  Current Version:
  - PostgreSql
  - PersistentVolumeClaims
  
  Future Versions:
  - @Todo  Kafka
  - @Todo  Redis
  - @Todo  Mysql
  - @Todo  MongoDB
  - @Todo  Hazlecast
  - @Todo  YugaByteDB
  - @Todo  ElasticSearch
  - @Todo  OpenShift Resource Exports 
  - @Todo  Source Code Repositories (Git, GitLab)
  
---


###  Installation
```sh
$ curl -sL https://raw.githubusercontent.com/RawDataLabs/Jigger/master/hack/install-operator.sh | bash 
```

###  Uninstall
```sh
$ curl -sL https://raw.githubusercontent.com/RawDataLabs/Jigger/master/hack/uninstall-operator.sh | bash 
```

## Use
Sample yaml files are provided under deploy/crds. To create a Migration, you must already have the CRD's present on the cluster and the operator will watch for any CR you create. The operator supports multiple options to specify which type of database client to use:

- **pvcmigrations.cache.rawdatalabs.cloud**
- **postgresqlmigrations.cache.rawdatalabs.cloud**
- **externalroutes.cache.rawdatalabs.cloud**  (special CR for masking real ip's or hostnames)


### Pvc Migration
1. Edit the PVC Custom Resource file to specify the Transfer Details

*Example **PvcMigration** CR*
```yaml
apiVersion: cache.rawdatalabs.cloud/v1alpha1
kind: PvcMigration
metadata:
  name: example-pvc-migration
  namespace: tutorial
spec:
  sourceStorage: dummy-source-pvc
  destinationStorage: dummy-destination-pvc
```

2. Create custom yaml resource file on kubernetes
```sh
$ kubectl create -f ./deploy/crds/cache_v1alpha1_pvcmigration_cr.yaml
```

3. Watch the corresponding jobs for completion
```sh
$ kubectl get pvcmigrations
$ kubectl get jobs
```



### PostgreSql Migration

1. Edit the PostgresqlMigration Custom Resource file to specify the Transfer Details

*Example **PostgresqlMigration** CR*
```yaml
apiVersion: cache.rawdatalabs.cloud/v1alpha1
kind: PostgresqlMigration
metadata:
  name: example-postgresql-migration
  namespace: tutorial
spec:
  backupFilePath: /tmp/backup.tar
  backupFormat: tar
  databaseDriver: postgresql
  dump: 
    hostname: postgresql-persistent.development.svc
    port: "5432"
    database: inventory
    username: postgres
    password: postgres
  restore: 
    hostname: postgresql.devtest.svc
    port: "5432"
    database: inventory
    username: postgres
    password: postgres
```

2. Create custom yaml resource file on kubernetes
```sh
$ kubectl create -f ./deploy/crds/cache_v1alpha1_postgresqlmigration_cr.yaml
```

3. Watch the corresponding jobs for completion
```sh
$ kubectl get postgresqlmigrations
$ kubectl get jobs
```
---


## Troubleshooting
To find the current status for the operator, type
```sh
$ kubectl get crd
$ kubectl get jobs
$ kubectl logs deployment/jigger-operator -f
```



Special Thanks to github.com/operator-framework, OperatorHub.io, Openshift.io, RedHat.com, Kubernetes.io, GitHub.com, Quay.io - I hope you Enjoy it
