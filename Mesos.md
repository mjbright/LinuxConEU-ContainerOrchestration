### Setup Mesos Master
```
docker-machine create --driver virtualbox mesosmaster

curl -L https://raw.githubusercontent.com/mjbright/LinuxConEU-ContainerOrchestration/master/mesos/master/docker-compose.yml > docker-compose.yml
docker-compose $(docker-machine config mesosmaster) -f docker-compose.yml up -d
```

### Access to the Marathon console from your laptop:
```bash
So from a terminal on your laptop open the ssh tunnel to **YOUR USER@YOUR SERVER**

MYSERVER=10.3.222.33
MYUSER=group7
MESOSMASTER=192.168.99.107

e.g. ssh group7@10.3.222.33 -L 8080:192.168.99.107:8080 -Nv


MYSERVER=10.3.222.33
MYUSER=group7
MESOSMASTER=192.168.99.107
ssh ${MYUSER}@${MYSERVER} -L 8080:${SWMASTERIP}:8080 -Nv
```

Then open your web browser at the page http://localhost:8080 and you should see marathon console.

### Setup Mesos Slaves
```bash
docker-machine create --driver virtualbox mesosslave1
docker-machine create --driver virtualbox mesosslave2

mkdir slave
cd slave
curl -L https://raw.githubusercontent.com/mjbright/LinuxConEU-ContainerOrchestration/master/mesos/slave/docker-compose.yml > docker-compose.yml

##########################################################
# Manually replace [zookeeper-host] in docker-compose.yml
# with $(docker-machine ip mesosmaster)
###########################################################

docker-compose $(docker-machine config mesosslave1) -f docker-compose.yml up -d
docker-compose $(docker-machine config mesosslave2) -f docker-compose.yml up -d
```

### Deploy applications on mesos cluster

- Use Marthon application descriptions [nginx.json](mesos/nginx.json) and [pacman.json](mesos/pacman.json) to deploy these apps on mesos/marathon

```bash
MESOS_MASTERIP=$(docker-machine ip mesosmaster)
curl -L https://raw.githubusercontent.com/mjbright/LinuxConEU-ContainerOrchestration/master/mesos/nginx.json > nginx.json
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" http://$MESOS_MASTERIP:8080/v2/apps -d @nginx.json

curl -L https://raw.githubusercontent.com/mjbright/LinuxConEU-ContainerOrchestration/master/mesos/pacman.json > pacman.json
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" http://$MESOS_MASTERIP:8080/v2/apps -d @pacman.json
```

- Play with the Marathon consol: scale applications, kill them etc...
