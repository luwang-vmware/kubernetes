MASTER_IP=$1
ssh   -o StrictHostKeyChecking=no capv@${MASTER_IP} "sudo rm -rf /var/log/*hollow-node*"
