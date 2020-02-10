# Operator Maintenance & Updates

## Upload App Manifests To Quay Application Repository
```
$ operator-courier push deploy/olm-catalog/jigger-operator rawdatalabs jigger-operator 0.0.1 XXXXXXXX
```

## Check operator Bundle syntax
```
$ operator-courier --verbose verify  ./deploy/olm-catalog/jigger-operator 
```

