# Quick Start: 


# FAQs:

## What is the intent of this repository?
To allow consumers of Big Bang to easily create their own clones of the Iron Bank Container Registry

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


# Goals for the initial Proof of Concept: 
1. Write some automation + docs that helps the user bring up a k3d cluster on Ubuntu
2. Deploy a Harbor Registry to the k3d cluster
   * Only install Harbor Registry on the k3d cluster w/o BigBang, istio ingress, etc.      
     (This is to minimize depeendencies and avoid a chicken and egg situation)       
   * Harbor will be exposed via Service Type Load Balancer on 443 instead of via Ingress
3. Write some automation + docs to populate Harbor with images from IronBank
4. Test against the Big Bang quick start repo
5. While working on the solution try to: 
   * Make it work in internet disconnected enviornments
   * Give a great user experience, in the form of minimial dependencies, minimal configuration      
     and good docs
   * Divide the automation up into stages that allow swaping in manual steps       
     Example: If someone wants to deploy to a ByoC instead of k3d        
   * Ansible-Runner should allow me to give a good user experience and ansible tags allow      
     spliting the automation into stages.     


# PreRequisites: 
* SSH access to an Ubuntu VM with docker preinstalled (Non-HA Harbor Registry)
