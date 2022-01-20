# Record the step to build and use kubemark per my experiment along with capi/capv

## Build kubemark image
1. follow  https://github.com/kubernetes/community/blob/master/contributors/devel/sig-scalability/kubemark-setup-guide.md to build the kubemark image for the target k8s release and upload the image to the registry.
``vendor/k8s.io/cri-api/pkg/apis/testing/fake_runtime_service.go supports auto assign a dhcp ipv4 address by this change``

## prepare outer and hybrid k8s cluster
``outer cluster refers to the one which hold hollow node pods; hybrid cluster refers to the one which holds real vm and hollow node``
1. use capi/capv to deploy a cluster called outer-cls, and save the outer-cls's kubeconfig file
2. use capi/capv to deploy a cluster called hybrid-cls, and save its kubeconfig file

## create hollow node using kubemark
1. Avoid hitting docker pull limit, use the scripts to download the dependency image on the worker noder of the outer-cls
``bash download_image.sh <node_ip>`` 
check the set_time_align_esx.sh and update the vc ip and datacenter per your test env
2. update the start-kubemark.sh for the KUBEMARK_IMAGE_TAG, KUBEMARK_IMAGE_REGISTRY,KUBECTL and NAMESPACE per test.
3. copy the hybrid-cls' kubeconfig into resources/kubeconfig.kubemark
4. bash start-kubemark.sh
5. manually apply the hollow-node.yaml into the outer-cls with specified namespace defined in NAMESPACE in 2.

## TIPS
1. CCM does not support different node deployed by different providers co-exists, so please remove CCM dm in the hybrid-cls before applying kubemark's hollow-node.yaml
2. if hit  out of disk for the node of the outer-cls, that is because of kubemark generates lots of logs, please use ``bash delete_logs.sh <node-ip>``.
