# Operator Maintenance & Updates

## Upload App Manifests To Quay Application Repository
```
$ operator-courier push deploy/olm-catalog/jigger-operator rawdatalabs jigger-operator 0.0.1 XXXXXXXX
```

## Check operator Bundle syntax
```
$ operator-courier --verbose verify  ./deploy/olm-catalog/jigger-operator 
```


## Start new Operator Version Build
```
$  operator-sdk build jigger-operator:v0.0.2
$  docker tag jigger-operator:v0.0.2 quay.io/rawdatalabs/jigger-operator:v0.0.2
$  docker push quay.io/rawdatalabs/jigger-operator:v0.0.2
$  operator-sdk olm-catalog gen-csv --csv-version 0.0.2
```