#!/bin/sh
#we will first check what the local ip is
localip="$(hostname -I | sed -e 's/\s.*$//')"
#enter your custom IP adress/domain name as second argument

if [ -n "$3" ]; then
localip=$3
fi

if [ -n "$2" ];then
user=$2
else
echo "Login user needs to specified for ssh"
exit
fi

localguiport=10101
remoteguiport=10101

docker-compose exec --user root server /bin/sh -c 'docker exec -it --user root $(docker ps -q --filter ancestor=hosts/'"$1"') ssh -t -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -R '$localguiport':localhost:'$remoteguiport' '$user'@'$localip''

