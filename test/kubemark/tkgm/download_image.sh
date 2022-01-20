MASTER_IP=$1
#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo crictl pull --creds luwang3:** docker.io/calico/cni:v3.20.3; sudo crictl pull --creds luwang3:WL123456 docker.io/calico/pod2daemon-flexvol:v3.20.3;"
#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo crictl pull --creds luwang3:** docker.io/calico/node:v3.20.3"
#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo crictl pull --creds luwang3:** docker.io/calico/kube-controllers:v3.20.3"

#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo crictl pull --creds luwang3:**  docker.io/busybox:latest"
ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo crictl pull --creds luwang3:**  docker.io/busybox:1.32"

#busybox:1.32 
#scp -o StrictHostKeyChecking=no  ./calico_tar/* capv@${MASTER_IP}:/tmp
#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo ctr -n=k8s.io  image import /tmp/cni.tar; sudo ctr -n=k8s.io  image import /tmp/node.tar"
#ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo ctr -n=k8s.io  image import /tmp/pod2daemon-flexvol.tar"
