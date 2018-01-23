#Useful commands 

## launch all instances 

```shell
source hadoop-openrc-v2.sh
terraform apply 
```

## Destroy all instances

```shell
source hadoop-openrc-v2.sh
terraform destroy
```

## launch specific instance 

```shell
source hadoop-openrc-v2.sh
terraform apply -target=openstack_compute_instance_v2.slv-1
```

## destroy specific instance

```shell
source hadoop-openrc-v2.sh
terraform destroy -target=openstack_compute_instance_v2.slv-1
```

## Recreate specific instance

```shell
source hadoop-openrc-v2.sh
terraform destroy -target=openstack_compute_instance_v2.slv-1
terraform apply -target=openstack_compute_instance_v2.slv-1
```

## Deploy Entire bigdata Infrastructure

```shell
source hadoop-openrc-v2.sh
terraform apply 
```

## Best Practise

### Source hadoop-openrc-v2.sh for environment variables before running terraform actions

password : hadoop

```shell
source hadoop-openrc-v2.sh
```

### use concurrency of 1 

```shell
terraform apply -parallelism=1
```
