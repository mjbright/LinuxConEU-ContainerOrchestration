
name: title1_inverse
layout: true
class: center, middle, inverse

---
##Container Orchestration: Which Conductor?
[.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]]
####ContainerCon Europe, Berlin, Oct 2016

### Mike Bright, HPE
### Haikel Guemar, RedHat
### Mario Loriedo, RedHat

---
name: title2_inversed_mixedText

##Container Orchestration: Which Conductor?
####ContainerCon Europe, Berlin, Oct 2016
<!-- [.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]] -->
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_whiteText_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo </h3>

<!-- [.bold.red[It's all about the tooling]] -->

---
name: title3_inversed_whiteText

##Container Orchestration: Which Conductor?
####ContainerCon Europe, Berlin, Oct 2016
<!-- [.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]] -->
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_whiteText_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright </h3>
<h3> <img width=93 height=30 src="images/RedHat_whiteText_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_whiteText_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo </h3>

<!-- [.bold.red[It's all about the tooling]] -->

---
name: title4_inversed
class: center, middle, inverse
##Container Orchestration: Which Conductor?
####ContainerCon Europe, Berlin, Oct 2016
<!-- [.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]] -->
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo </h3>


---
name: title5
layout: false
class: center, middle, 

##Container Orchestration: Which Conductor?
####ContainerCon Europe, Berlin, Oct 2016
<!-- [.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]] -->
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo </h3>


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

I'm not an expert in this fast moving field, but I hope to give you an overview so you better understand the many tools on offer, so you can differentiate between them.

---
layout: false
class: center, middle
## So many choices ... what to do?
## Does it really matter?

---
layout: false
class: middle
# We've come a long way already

- History of containers, orchestration ...
  - Docker is a given

- This is the new battleground 
  - We can choose amongst Docker Swarm(*), Kubernetes, Apache Mesos(*), Fleet, Rancher, ...
    - or combinations thereof ...
  - But
    - what do they do?
    - why do we need them
    - is there a winner - do we need a winner ?

---
layout: false
# The trend to micro-services

## In the past applications tended to be monolithic.

## Scaling meant to "scale up" by adding more power (CPU, RAM, disk) to a node.
---
layout: false
# Container Orchestration - what/why?

## In the past applications tended to be monolithic.

## Scaling meant to "scale up" by adding more power (CPU, RAM, disk) to a node.
---
layout: false
# How containers help?

#### Container solutions such as Docker got beyond the isolation capabilities of LXC by providing simple to use software solutions to enable package of apps with their dependencies allowing portable applications between systems.

#### Containers are lightweight

#### Containers can be shared

#### Containers allow to use the same application binaries on development, test and production systems whether that be on a laptop, server or in the cloud.

---
layout: false
.left-column[
  ## The Big 3
  <img src=images/docker.png width=100 /><br/>
  <img src=images/mesos-logo.png width=100 /><br/>
  <img src=images/kubernetes.png width=100 /><br/>
  .footnote[.red[] [????](https://docker.com)]
]

.right-column[
## Orchestration Choices: The big 3

- Docker Swarm
  - Docker swarm
  - The swarm toolkit
  - Docker "swarm mode"

- Apache Mesos
  - Frameworks
    - Marathon
    - Chronos
  - Plugins
    - Jenkins
  - Minmesos?
  
- Kubernetes
]

---
.left-column[
  ## The rest
  .footnote[.red[] [????](https://docker.com)]
]

.right-column[
## Orchestration Choices: The rest ...
## The rest
- Rancher, Fleet, 
- (for static configuration): Ansible, CloudSlang, 
- Juju
]

---
layout: false
.left-column[
  <img src=images/docker.png width=100 /><br/>
  ## Docker Swarm
  .footnote[.red[] [docker.com](https://docker.com)]
]

.right-column[
  Docker swarm

- Docker engine with Swarm Mode

- Swarm Toolkit

- Swarm

]

---
layout: false
.left-column[
  <img src=images/docker.png width=100 /><br/>
  ## Docker Swarm Architecture
  .footnote[.red[] [docker.com](https://docker.com)]
]

.right-column[
  Docker swarm Architecture

  <img src=images/docker_swarm_archi.jpg width=600 /><br/>
]

---
layout: false
.left-column[
  <img src=images/docker.png width=100 /><br/>
  ## Docker Swarm - Getting started
  .footnote[.red[] [docker.com](https://docker.com)]
]

.right-column[

Refer to Jerome Pettazoni's wshop on github
]

---
layout: false
.left-column[
  <img src=images/mesos-logo.png width=100 /><br/>
  ## Apache Mesos
  .footnote[.red[] [mesos.apache.org](http://mesos.apache.org/)]
]

.right-column[
  Apache Mesos

- ????

- ????

- ????

]

---
layout: false
.left-column[
  <img src=images/mesos-logo.png width=100 /><br/>
  ## Apache Mesos Architecture
  .footnote[.red[] [mesos.apache.org](http://mesos.apache.org/)]
]

.right-column[
  Apache Mesos Architecture

  <img src=images/mesos_archi.jpg width=300 /><br/>
http://mesos.apache.org/documentation/latest/architecture/

]

---
layout: false
.left-column[
  <img src=images/mesos-logo.png width=100 /><br/>
  ## Apache Mesos - Getting started
  .footnote[.red[] [mesos.apache.org](http://mesos.apache.org/)]
]

.right-column[

minimesos?
]

---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
Kubernetes works with the following concepts:

[**Cluster**](docs/admin/README.md)
: A cluster is a set of physical or virtual machines and other infrastructure resources used by Kubernetes
 to run your applications. Kubernetes can run anywhere! See the [Getting Started Guides](docs/getting-star
ted-guides/) for instructions for a variety of services.

[**Node**](docs/admin/node.md)
: A node is a physical or virtual machine running Kubernetes, onto which pods can be scheduled.

[**Pod**](docs/user-guide/pods.md)
: Pods are a colocated group of application containers with shared volumes. They're the smallest deployabl
e units that can be created, scheduled, and managed with Kubernetes. Pods can be created individually, but
 it's recommended that you use a replication controller even if creating a single pod.

[**Replication controller**](docs/user-guide/replication-controller.md)
: Replication controllers manage the lifecycle of pods. They ensure that a specified number of pods are ru
nning
at any given time, by creating or killing pods as required.

[**Service**](docs/user-guide/services.md)
: Services provide a single, stable name and address for a set of pods.
They act as basic load balancers.

[**Label**](docs/user-guide/labels.md)
: Labels are used to organize and select groups of objects based on key:value pairs.

]

---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes Architecture
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
  Kubernetes Architecture

- ????

- ????

- ????

  <img src=images/kubernetes_archi.png width=300 /><br/>

]

---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes - Getting started
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
See "HPE Kubernetes" references +?
- minikube?
- ...
]

---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes - Resources
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
#### Documentation1

Kubernetes documentation is organized into several categories.

  - **Getting started guides**
    - for people who want to create a Kubernetes cluster
      - in [Creating a Kubernetes Cluster](docs/getting-started-guides/README.md)
    - for people who want to port Kubernetes to a new environment
      - in [Getting Started from Scratch](docs/getting-started-guides/scratch.md)
  - **User documentation**
    - for people who want to run programs on an existing Kubernetes cluster
    - in the [Kubernetes User Guide: Managing Applications](docs/user-guide/README.md)
        *Tip: You can also view help documentation out on [http://kubernetes.io/docs/](http://kubernetes.i
o/docs/).*
    - the [Kubectl Command Line Interface](docs/user-guide/kubectl/kubectl.md) is a detailed reference on
      the `kubectl` CLI
    - [User FAQ](https://github.com/kubernetes/kubernetes/wiki/User-FAQ)

]
---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes - Resources
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
#### Documentation - 2

  - **Cluster administrator documentation**
    - for people who want to create a Kubernetes cluster and administer it
    - in the [Kubernetes Cluster Admin Guide](docs/admin/README.md)
  - **Developer and API documentation**
    - for people who want to write programs that access the Kubernetes API, write plugins
      or extensions, or modify the core Kubernetes code
    - in the [Kubernetes Developer Guide](docs/devel/README.md)
    - see also [notes on the API](docs/api.md)
    - see also the [API object documentation](docs/api-reference/README.md), a
      detailed description of all fields found in the core API objects
  - **Walkthroughs and examples**
    - hands-on introduction and example config files
    - in the [user guide](docs/user-guide/README.md#quick-walkthrough)
    - in the [docs/examples directory](examples/)
  - **Contributions from the Kubernetes community**
    - in the [docs/contrib directory](contrib/)
]
---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes - Resources
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
#### Documentation - 3

  - **Design documentation and design proposals**
    - for people who want to understand the design of Kubernetes, and feature proposals
    - design docs in the [Kubernetes Design Overview](docs/design/README.md) and the [docs/design director
y](docs/design/)
    - proposals in the [docs/proposals directory](docs/proposals/)
  - **Wiki/FAQ**
    - in the [wiki](https://github.com/kubernetes/kubernetes/wiki)
    - troubleshooting information in the [troubleshooting guide](docs/troubleshooting.md)

#### Community, discussion, contribution, and support

See which companies are committed to driving quality in Kubernetes on our [community page](http://kubernet
es.io/community/).

Do you want to help "shape the evolution of technologies that are container packaged, dynamically schedule
d and microservices oriented?"

You should consider joining the [Cloud Native Computing Foundation](https://cncf.io/about). For details ab
out who's involved and how Kubernetes plays a role, read [their announcement](https://cncf.io/news/announc
ement/2015/07/new-cloud-native-computing-foundation-drive-alignment-among-container).


]
---
layout: false
.left-column[
  ## Other orchestrators
]

.right-column[
  Other orchestrators

- Fleet

- Rancher

- Juju

- Ansible

  <img src="images/other_orchestrators.png" />

]

---
layout: false
.left-column[
  ## Other orchestrators
]

.right-column[
  Other orchestrators

- Fleet

- Rancher

- Juju

- Ansible

  <img src="images/other_orchestrators.png" />

]
---
layout: false
.left-column[
  ## Combining Orchestrators
]

.right-column[
  Combining Orchestrators

- ????

![image](images/????.png)

]

---
layout: false
.left-column[
  ## Demo ????
]

.right-column[
  Demo ????

- ????

![image](images/????.png)

]

---
layout: false
.left-column[
  ## Use cases
]

.right-column[
  Use cases

- Stackanetes, Mirantis

- OpenShift

- EBay : Kubernetes + OVS

![image](images/????.png)

]
---
layout: false
.left-column[
  ## Players
]

.right-column[
  Players

- RedHat: OpenShift (PaaS), Project Atomic

- CoreOS: CoreOS, GIFFE

- Google

- MS

- VMWare


![image](images/????.png)

]

---
layout: false
.left-column[
   ## So are they all the same?
]

- they are converging on many points

- differences ...

---
layout: false
# Also - our own lab ...

Come along tomorrow

or just follow along on github


---
---
name: last-page
template: inverse

## That's all folks (for now)!

Slideshow created using [remark](http://github.com/gnab/remark).
