locals {
    userdata = <<EOT
    #!/bin/bash
    aws s3 cp s3://cnx-nextgen-devops/scripts/Ec2Init.sh  ./Ec2Init.sh
    chmod 755 ./Ec2Init.sh
    ./Ec2Init.sh cassandra
    partitionName=$(df -P /opt | awk 'END{print $1}')
    devicename=$(lsblk -no pkname $partitionName)
    devicemountPoint="/dev/"$devicename
    echo $devicemountPoint
    partition=$(echo $${partitionName#"$devicemountPoint"} | sed 's/[^0-9]*//g')
    echo $partition
    sudo growpart $devicemountPoint $partition
    sudo xfs_growfs -d /opt
    hostname=`hostname`
    sudo chef-client -r 'role[data-dse-cassandra-bnr]' -E  ${var.chef_env_name} -l info -L /var/log/chef-client.log -N node-$hostname
    sleep 180
    aws s3 cp s3://cnx-nextgen-devops/scripts/seednode2.sh  ./seednode2.sh
    chmod 755 ./seednode2.sh
    sed -i -e 's/\r$//' ./seednode2.sh
    ./seednode2.sh ${var.seednode_ssm_param_name} ${var.isprimary_ssm_param_name}
    sleep 10
    mkdir /opt/tmp && chown -R cassandra:cassandra /opt/tmp && chmod -R 755 /opt/tmp
    sed -i '3d' /var/lib/datastax-agent/conf/address.yaml
    echo -e "\ntmp_dir: /opt/tmp" >> /var/lib/datastax-agent/conf/address.yaml
    service datastax-agent restart
    sleep 120
    aws s3 cp s3://cnx-nextgen-devops/scripts/write_pems_to_s3.py  ./write_pems_to_s3.py
    chmod 755 ./write_pems_to_s3.py
    aws s3 cp s3://cnx-nextgen-devops/scripts/export_pems.sh  ./export_pems.sh
    chmod 755 ./export_pems.sh
    sed -i -e 's/\r$//' ./export_pems.sh
    ./export_pems.sh
    EOT
}