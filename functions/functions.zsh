# Work Related Functions.

machine_id () {
  kubectl --namespace=$1 --context=$2 get pods | grep core-$3-$4 | grep Running | head -n 1 | cut -d ' ' -f1
}

cssh () {
  readonly NAMESPACE=platform
  readonly CONTEXT=staging.k8s.infra.unbabel.com
  machine_type=${1:-workers}

  kubectl --namespace=$NAMESAPCE --context=$CONTEXT exec -it $(machine_id $NAMESPACE $CONTEXT $machine_type 'staging') python manage.py shell
}

csbash () {
  readonly NAMESPACE=platform
  readonly CONTEXT=staging.k8s.infra.unbabel.com
  machine_type=${1:-workers}

  kubectl --namespace=$NAMESAPCE --context=$CONTEXT exec -it $(machine_id $NAMESPACE $CONTEXT $machine_type 'staging') /bin/bash
}

cpsh () {
  readonly NAMESPACE=platform
  readonly CONTEXT=aws-production
  machine_type=${1:-workers}

  kubectl --namespace=$NAMESAPCE --context=$CONTEXT exec -it $(machine_id $NAMESPACE $CONTEXT $machine_type 'production') python manage.py shell
}

cpbash () {
  readonly NAMESPACE=platform
  readonly CONTEXT=aws-production
  machine_type=${1:-workers}

  kubectl --namespace=$NAMESAPCE --context=$CONTEXT exec -it $(machine_id $NAMESPACE $CONTEXT $machine_type 'production') /bin/bash
}
