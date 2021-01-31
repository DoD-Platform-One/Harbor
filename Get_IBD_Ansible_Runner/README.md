# What is this 
No working Ansible container exists in IronBank atm, so we'll build one derived from UBI8 IB Image      
Also even after a working IronBank Ansible exists this still may be desireable, as this allows      
easier update/control over ansible-runner dependencies like kubectl, helm, etc.

```bash
# cd into this directory
./image_helper.sh build 	#Builds Docker Image of Ansible-Runner from IronBank's UBI8 Image
./image_helper.sh package	#Packages Docker Image into .tar.gz
./image_helper.sh load		#Loads .tar.gz
```

If the Dockerfile gets updated, increment the version in image_helper.sh

# Note: Iron Bank Ansible Image doesn't seem to work atm
```bash
docker run -it registry1.dsop.io/ironbank/opensource/ansible/ansible:2.10.0 /bin/bash     
# /bin/bash and /bin/ansible are both unknown commands
```
