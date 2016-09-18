name: title_inversed_whiteText
layout: false
class: center, middle, inverse

##Container Orchestration: Which Conductor?
###ContainerCon Europe, Berlin, Oct 2016
<!-- [.bold.green[Container Orchestration: Swarm, Mesos, Kubernetes - Which Conductor?]] -->
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_whiteText_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright, <img src="images/Twitter_Bird.svg" width=24 /> @mjbright </h3>
<h3> <img width=93 height=30 src="images/RedHat_whiteText_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar, <img src="images/Twitter_Bird.svg" width=24 /> @hguemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_whiteText_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo, <img src="images/Twitter_Bird.svg" width=24 /> @mariolet </h3>


???
SpeakerNotes:

TODO: Replace (many) images with "hand drawn" images (via Wacom or Inkscape?)
      Use Jupyter/matplotlib->svg/%%svg for images, graphs, animations ...

TODO: Take tips from this presn: http://asmeurer.github.io/python3-presentation/slides.html#1
      How does this guy do his titles? http://kjbekkelund.github.io/js-architecture-backbone/#2

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

Everything I tell you may be factual today, but will surely be false in a few months as these fast moving projects vie for position.

---
layout: false
class: center, middle
## A little bit of history

So let's first look at what's happened in a very short time.

<img width=800 src="images/timeline.svg" />

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## Containers

#### TODO: image showing "growth" (?) of containers ...
- LXC, Docker, rkt, LXD, runC/OCI, Garden
<img width=400 height=300 src="images/TREND.svg" />
]

???
SpeakerNotes:
talk about
- pre-historique containers (Solaris Zones, BSD Jails, HPUX xxx)
- Linux Containers (LXC) in mainline kernel from 2010
- Then came Docker
  Of course containers existed already, but Docker made them usable
  Of course Docker also did an incredible job marketing their tools
  and inciting developers to adopt and evangelize.

  Docker continue to push boundaries to do complex stuff whilst keeping
  their software simple to use.

  Nevertheless other players wanted more influence and pushed for an open standard.

- OCI was formed in June 2015.
   https://www.opencontainers.org/
   Docker donated libcontainer code        ==> runC
                  base format (+rkt appc?) ==> OCF

- Alternatives: rkt, LXD, Garden/Guardian(?)
      but Docker has the mindshare and continues to make great progress. 
       So although I'm pleased to see alternatives - Open Source alternatives - when I talk about container (engines) I generally consider Docker as a given.

  

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
## &mu;-OSes

Several vendors are developing &mu;-OSes, small OS (mainly Linux) implementations to be the basis for container engine hosts
whether they be bare-metal or virtual **host machines**.

These OSes are small, with fast startup, deployment, small attack surface and often *"atomic"* software updates.

- CoreOS          (CoreOS)
- Project Atomic  (RedHat)
- Photon          (VMWare)
- RancherOS       (Rancher)
- Nano Server OS  (Microsoft)
]

???
SpeakerNotes:
Describe the raison d'etre of micro-OSes
- small, including only what's needed
- security: small attack surface
- "atomic" updates to OS (CoreOS?): explain

Mention HPE ContainerOS for The Machine (HPE Linux)

TODO: http://www.lemagit.fr/conseil/Nano-Server-Microsoft-entre-de-plein-pied-dans-le-monde-des-micro-services


---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## &mu;-Services
]

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ##From monoliths to &mu;-services
]

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## From monoliths to &mu;-services
Remember when **high availability** meant this ...?

<img width=400 height=300 src="images/Active-Standby.svg" />

Server nodes running **monolithic applications** in **Active-Standby** modes,
as 1+1, N+1, or N+M

Scaling meant to **"scale up"** by adding CPU, RAM, disk.
But there's a limit to this ... then you have to **scale out**
]


???
SpeakerNotes:

But there's a limit to scaling up ... then you have to manage your application across multiple nodes which means
orchestration, load balancing, monitoring across nodes.

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## From monoliths to &mu;-services

#### To scale we broke into an N-tier architecture

TODO: schema to demonstrate breaking down of monoliths to N-tier allowing
      flexibility to scale out, possibility of better h/w utilisation

      ==> beakers with different coloured, different size balls ...

<img width=100 height=120 src="images/Beaker (1).svg" />
<img width=100 height=120 src="images/Beaker.svg" />
<img width=100 height=120 src="images/Becherglas-leer-simpel.svg" />
<img width=100 height=120 src="images/Becherglas-leer-Skala.svg" />
<img width=100 height=120 src="images/becher.svg" />
]

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## From monoliths to &mu;-services

#### Then came &mu;-services ..

TODO: schema
      ==> more/smaller beakers/balls ...
<img width=100 height=120 src="images/Bearker_balls.svg" />
<img width=100 height=120 src="images/Liquid-separted-in-beaker.svg" />
<img width=100 height=120 src="images/Solution-in-beaker.svg" />

Now we can achieve much better hardware utilisation because of the smaller size of components.
]

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## History
]
.right-column[
    ## From monoliths to &mu;-services

But 1000's of nodes are unmanageable ... aren't they?

|   |   |
|---|---|
| We can't take care of our | <img width=100 height=120 src="images/johnny-automatic-sad-dog-with-a-broken-leg.svg" />, |
| so we have to treat them like | <img width=100 height=120 src="images/Holstein-Cow.svg" /> |

that's cloud native !


]

???
SpeakerNotes:

---
layout: false
class: center, middle
.left-column[
    ## Orchestration
]
.right-column[
## So we need orchestration

And we already have many choices for<br/>
**Container Orchestration Engines**

|         | |         |
|:--------|-|:--------|
| Docker Swarm | :  | Docker Inc.      |
| Kubernetes   | :  | Cloud Native Computng Foundation      |
| Apache Mesos | :  | Apache Software Foundation      |
| Fleet        | :  | CoreOS      |
| Cattle | :  | Rancher  |
| Nomad  | :  | HashiCorp |

<br/>
These COEs are to varying degrees<br/> **Imperative** or **Declarative**
]

???
SpeakerNotes:

- This is the new battleground  (Container Orchestration Wars)
  - We can choose amongst Docker Swarm(*), Kubernetes, Apache Mesos(*), Fleet, Rancher, ...
    - or combinations thereof ...
  - But
    - what do they do?
    - why do we need them
    - is there a winner - do we need a winner ?

---
layout: false
class: center, middle
.left-column[
    ## Orchestration
]
.right-column[
## Imperative or Declarative

<br/> <br/>

|                   |         Imperative     |               Declarative      |
| ----------------- | ---------------------- | ------------------------------ |
| **Tell the system**   | what to do             | desired state                  |
|                   | *"start a new node"* | *"3 mysql nodes"* |
| **Intelligence**      | Operator               | Orchestration Engine           |
|                       | ...                    |                                |
| **Flexibility**       | Best                   | Least                          |



]


???
SpeakerNotes:

Container Orchestration Engines can be imperative or declarative

We'll see that Docker Swarm is mostly imperative for now, this has the advantage of being very flexible an operator can request changes precisely as needed.
Docker compose brings a declarative element.

Kubernetes allows to tag all system elements with metadata.
This greatly facilitates declarative requests, e.g. we can say I want 3 Mysql nodes to run **and** they must all have SSDs **and** they must all be in the SW region.
Kubernetes will take care of the rest taking into account available resources as nodes fail/come back on line or apps fail/come back on line.

Apache Mesos is quite imperative, depending upon the scheduler framework used.
Kubernetes can be used as a scheduler enabling declarative scheduling.
It tends to require a set of specialists to manage a cluster.



---
layout: false
# How containers help?

Container solutions such as Docker go beyond the isolation capabilities of LXC by providing simple to use software solutions to enable packaging of apps with their dependencies allowing portable applications between systems.

Containers are lightweight

Containers can be shared

Containers allow to use the same application binaries on development, test and production systems whether that be on a laptop, server or in the cloud.

???
SpeakerNotes:

---
layout: false
.left-column[
  ## The Big 3
  <img src=images/docker.png width=100 /><br/>
  <img src=images/mesos-logo.png width=100 /><br/>
  <img src=images/kubernetes.png width=100 /><br/>
]

.right-column[
## Main Orchestration Choices

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
  - Minmesos
  - Mesosphere, DC/OS
  
- Kubernetes
  .footnote[.red[] [But lets not forget the alternatives ...]]
  <!-- .footnote[.red[] [????](https://docker.com)] -->
]

???
SpeakerNotes:

TODO: Follow Docker logo guidelines here:
    https://www.docker.com/brand-guidelines

TODO: Comparison of Swarm vs. Swarm Toolkit vs. Swarm Mode

TODO: Mesos vs. fwks (Marathon, Chronos, Kubernetes?, Hadoop?) vs. plugins, Jenkins
      Mesosphere and DC/OS, Minimesos, ...


---
.left-column[
  ## The rest
  .footnote[.red[] [????](https://docker.com)]
]

.right-column[
## Orchestration Choices: The rest ...
- Rancher
-  Fleet
-  Nomad

The following are static configuration engines which can be used to automate tasks but they are not orchestration engines as such:
- Ansible
- CloudSlang
- Vagrant
- Juju
]

???
SpeakerNotes:
- TODO: Add info about
  - Rancher
  - Fleet
  - Nomad

- Juju: https://jujucharms.com/

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

???
SpeakerNotes:

---
layout: false
.left-column[
  <img src=images/docker.png width=100 /><br/>
  ## Docker Swarm
  .footnote[.red[] [docker.com](https://docker.com)]
]

.right-column[
  ## Docker Swarm Architecture

  <img src=images/docker_swarm_archi.jpg width=600 /><br/>
]

???
SpeakerNotes:

TODO: replace image ...

---
layout: false
.left-column[
  <img src=images/docker.png width=100 /><br/>
  ## Docker Swarm
  .footnote[.red[] [docker.com](https://docker.com)]
]

.right-column[

## Getting started
Refer to Jerome Pettazoni's wshop on github
]

???
SpeakerNotes:

---
layout: false
.left-column[
  <img src=images/mesos-logo.png width=100 /><br/>
  ## Apache Mesos
  .footnote[.red[] [mesos.apache.org](http://mesos.apache.org/)]
]

.right-column[
  Apache Mesos

Arguably the most production ready orchestration today, exists since 2009.

Used in production by

- Twitter

- .... ????

Can scale to ~ 10,000 nodes.

Mesos is used in conjunction with Frameworks such as
- Marathon: manages long running tasks
- Chronos: designed for job orchestration
- Hadoop: (YARN?)
- Kubernetes: allowing delcarative use

]

???
SpeakerNotes:

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

Image courtesy of
http://mesos.apache.org/documentation/latest/architecture/

]

???
SpeakerNotes:

TODO: redo architecture image?

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

???
SpeakerNotes:

TODO: Add links to more Mesos tutorials, startup systems ...

---
layout: false
.left-column[
  <img src=images/kubernetes.png width=100 /><br/>
  ## Kubernetes
  .footnote[.red[] [kubernetes.io](https://kubernetes.io)]
]

.right-column[
Kubernetes is an open source project created by Google based on it's extensive experience running containers
(millions of containers over a decade or so) from it's Borg and Omega projects.

Started ~ Oct 2014, reach v1.0 in in July 2015 and currently at v1.4
It is managed by the Cloud Native Computing Foundation
https://cncf.io/
]


???
SpeakerNotes:

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

???
SpeakerNotes:

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

  <img src=images/kubernetes_archi.png width=450 /><br/>

]

???
SpeakerNotes:

TODO: Recreate Kubernetes architecture image

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

???
SpeakerNotes:

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

???
SpeakerNotes:

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
???
SpeakerNotes:

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
???
SpeakerNotes:

---
layout: false
.left-column[
  ## Other orchestrators
]

.right-column[
  Other orchestrators

- Fleet

- Rancher

- Nomad

  <img src="images/other_orchestrators.png" />

]

???
SpeakerNotes:

---
layout: false
.left-column[
  ## Use cases
]

.right-column[
  Use cases

- Stackanetes, Mirantis

- OpenShift

- Deis

- CloudFoundry PaaS (Has it's own runC implementation: Garden/Guardian, orchestration; Diego)

- EBay : Kubernetes + OVS

- CoreOS: Tectonnic (commercial Kubernetes offering)

- OpenStack Magnum Project; Supports Docker Swarm, Apache Mesos and Kubernetes (concurrently) enabling
   Infrastructure and Container Management.

- Twitter: Mesos

![image](images/????.png)

]
???
SpeakerNotes:

Note; App container management can scale out to existing nodes, but cannot manage infrastructure resources.
OpenStack as a IaaS, via Ironic project can spin up new BM/VM/"LXD?" nodes to provide new resources.


---
layout: false
.left-column[
  ## Players
]

.right-column[
  Choices made by Industry Players

- RedHat: OpenShift (PaaS), Project Atomic

- CoreOS: CoreOS, GIFFE

- Google: Kubernetes used for GCP

- MS

- VMWare


![image](images/????.png)

]

???
SpeakerNotes:

---
layout: false
.left-column[
  ## What's common
]

.right-column[
They are converging on many points

They are tending to add 'declarative specification' capabilities.

It's no longer feasible for an operator to decide on which node to deploy especially when complex constraints exist
- making use of specialized hardware, e.g. SSD best for some operations
- adapting to hardware failures

An operator specifies the "desired state" and the orchestrator does the rest.

![image](images/????.png)

]

???
SpeakerNotes:

TODO: hmm, to what extent do they trend to declarative (not either or ...)

---
layout: false
.left-column[
  ## What's different
]

.right-column[


Rancher lightweight


![image](images/????.png)

]

???
SpeakerNotes:

---
layout: false
.left-column[
  ## Orchestration Lab
]

.right-column[
  Come along to our lab tomorrow

    - Link to schedule

    - Link to lab
       - Docker Swarm
       - Kubernetes
       - Apache Mesos

    - Link to github repo

or just follow along on github


- Come along to Marios' presn

    - Link to schedule

    - Link to lab

    - Link to github repo

![image](images/????.png)

]


???
SpeakerNotes:

---
name: demo-page-1
template: inverse
class: center, middle, 

#### Demo - Apache Mesos

<iframe src="https://localhost:9999/" width="800" height="600" >
  <p>Server is not running</p>
</iframe>

???
SpeakerNotes:

TODO: replace with links to animated gifs (from tty2gif)

---
name: demo-page-2
template: inverse
class: center, middle, 

#### Demo - Kubernetes

<iframe src="https://localhost:9999/" width="800" height="600" >
  <p>Server is not running</p>
</iframe>

???
SpeakerNotes:
TODO: replace with links to animated gifs (from tty2gif)

---
name: demo-page-3
template: inverse
class: center, middle, 

#### Demo - Docker Swarm

<iframe src="https://localhost:9999/" width="800" height="600" >
  <p>Server is not running</p>
</iframe>

???
SpeakerNotes:
TODO: replace with links to animated gifs (from tty2gif)

---
name: resources-page-1
template: inverse
class: center, middle, 
layout: false
.left-column[
  ## Resources
]

.right-column[

##Books

| Publisher | Title | Author |    |
|:-----------|:-------|:--------|----|
| OReilly   | Docker Cookbook   | Seb ...
| OReilly   | Docker ??   | Mouat ...
| OReilly   | [Early Access] Kubernetes   | Kelsey Hightower ...
| Manning   | [MEAP] CoreOS in Action |    |
| Manning   | [MEAP] Kubernetes in Action |    |

]
???
SpeakerNotes:

---
name: resources-page-2
template: inverse
class: center, middle, 
.left-column[
  ## Resources
]

.right-column[


##Articles/Organisms

Cloud Native Computing Foundation - Kubernetes, Prometheus
https://cncf.io/
]

???
SpeakerNotes:

---
name: resources-page-3
template: inverse
class: center, middle, 
.left-column[
  ## Resources
]

.right-column[

##Videos

##Repos
]


???
SpeakerNotes:

---
name: last-page
template: inverse
class: center, middle, 

## Questions?

## Thank you
<h3> <img width=120 src="images/Hewlett_Packard_Enterprise_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mike Bright, @mjbright </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp; Haikel Guemar, @hguemar </h3>
<h3> <img width=93 height=30 src="images/RedHat_logo.svg" /> &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Mario Loriedo, @mariolet </h3>



