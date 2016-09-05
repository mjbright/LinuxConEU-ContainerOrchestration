
name: inverse
layout: true
class: center, middle
---
class: inverse

##Container Orchestration: Which Conductor?
[.green.bold[The Lab]]
### Mike Bright, HPE
### Haikel Guemar, RedHat
### Mario Loriedo, RedHat
##ContainerCon Europe, Berlin, Oct 2016

???
SpeakerNotes:
Abstract
---------
#### .footnote[This presentation on [github](https://github.com/mjbright/LinuxConEU-ContainerOrchestration) on [ContainerCon Schedule](https://linuxconcontainerconeurope2016.sched.org/event/7oHV/container-orchestration-swarm-mesos-kubernetes-which-conductor-mike-bright-hpe)]



Oh my, as if we didn’t have enough container choices with LXC, Docker, rkt, LXD, we still have to choose a container orchestrator and there are lots of them !

Worse - the choice of orchestrator is the new industry battleground.
Feature sets increase rapidly and industry players are making acquisitions and investments.

It’s still early days in container orchestration and so existing solutions partially overlap meaning that combinations of orchestrators may be needed.

So how should you choose for your use case?

In this talk we’ll take a look at what is orchestration and why you need it.
We’ll look at the main contenders amongst Docker Swarm, Google’s Kubernetes, Apache Mesos as well as Fleet, Rancher/cattle and Juju.

We’ll compare and contrast the existing solutions, look at where they are heading and how you can use them in your solution today and tomorrow.

---
.left-column[
## Lab contents
]

.right-column[
## we will look at each of
- Docker Swarm mode
- Kubernetes
- Apache Mesos

In less than 2 hours you won't become expert but will get some hands on experience.
]

---
layout: false
.left-column[
  ## Installing the lab
]

.right-column[
  You can either

- Install our vagrant box

- Run on our infrastructure

]

---
layout: false
.left-column[
  ## Vagrant install
]

.right-column[
  ## Vagrant install

![image](images/vagrant.png)

]

---
layout: false
.left-column[
  ## Use our infra
]

.right-column[
  HP infra

- ????

- ????

- ????

![image](images/hpe-logo.png)

]

---
name: last-page
template: inverse

## That's all folks (for now)!

Slideshow created using [remark](http://github.com/gnab/remark).

