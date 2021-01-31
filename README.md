# What is the intent of this repository?
To allow consumers of Big Bang to easily create their own clone of the Iron Bank Container Registry, so they can create a Robot Account for use in Big Bang Deployments.

# Prerequisites: 
Your Admin Laptop needs:
  * SSH access to an Ubuntu VM
  * Docker and Docker Compose Installed

# Quick Start: 
```bash
[user@Laptop:~]
# STEP 1: Login to IronBank
# Login to https://registry1.dso.mil to lookup your docker login username and password
docker login https://registry1.dso.mil


# STEP 2: Get Iron Bank Derived Ansible-Runner
cd ~/Desktop
git clone https://repo1.dso.mil/platform-one/big-bang/apps/sandbox/harbor.git
cd ~/Desktop/harbor/Get_IBD_Ansible_Runner
./image_helper.sh build # Has a handy help command with more package and load options


# STEP 3: Configuration Prep Work
# 3.1: Update the ansible hosts inventory file to point to the IP address of your Ubuntu 20.04 Server
vi ~/Desktop/harbor/ansible-runner/inventory/hosts 

# 3.2: Update docker-compose.yml to point to the private ssh key that corresponds to the Server
vi docker-compose.yml


# STEP 4: Run Ansible-Runner
cd ~/Desktop/harbor
docker-compose run ansible ansible-runner run /runner --cmdline "--tags deploy_k3d_test_cluster"
docker-compose run ansible ansible-runner run /runner --cmdline "--tags deploy_harbor"
```

# FAQs:

## Why do I need to clone Iron Bank? Can't I just pull directly from Iron Bank? 
Big Bang deployments must pull from a registry that uses HTTPS and basic authentication. So a Big Bang Cluster basically needs a Robot Account. Getting a Robot Account from Iron Bank involves a bit of red tape. By cloning Iron Bank you can create your own Robot Account in a self service fashion. 

## Do I need a robot account? Can't I just use my personal username and password to pull?
There is a an upstream bug that makes this solution problematic. Iron Bank uses Harbor Container Registry, and Harbor Container Registry has a long standing issue that's "by design" / won't be fixed.         
Basically your personal username and password will only work if you have an active OIDC session with Iron Bank. So if you haven't logged into Iron Bank recently then your CLI credentials will randomly stop working until you login to Iron Bank again to refresh your OIDC session.       
It doesn't look like that issue will be fixed anytime soon, but you can read up on it via these links:       
* https://github.com/goharbor/harbor/issues/10737
* https://github.com/goharbor/harbor/issues/13778
* https://github.com/goharbor/harbor/issues/12172
* https://repo1.dso.mil/platform-one/private/big-bang/ironbank/ironbank-bootstrap/-/issues/83


## Goals for the Initial Proof of Concept:          
1. Write some automation + docs that helps the user bring up a k3d cluster on Ubuntu
2. Deploy a Harbor Registry to the k3d cluster
   * Only install Harbor Registry on the k3d cluster w/o BigBang, istio ingress, etc.      
     (This is to minimize depeendencies and avoid a chicken and egg situation)       
   * Harbor will be exposed via Service Type Load Balancer on 443 instead of via Ingress
3. Write some automation + docs to populate Harbor with images from IronBank
4. Test against the Big Bang quick start repo
5. While working on the solution try to: 
   * Design it so it could work in internet disconnected enviornments with minimal dependencies
   * Give a great user experience, in the form of minimial dependencies, minimal configuration      
     and good docs
   * Divide the automation up into stages that allow swaping in manual steps       
     Example: If someone wants to deploy to a ByoC instead of k3d        
   * Ansible-Runner should allow me to give a good user experience and ansible tags allow      
     spliting the automation into stages.     

## Non-Goals for the Initial Proof of Concept:          
1. Not going to test Internet Disconnected Deployment
2. Not going to do a HA Setup
