# What is this 
No working Ansible container exists in IronBank, so we'll build one derived from UBI8 IB Image
Also this allows easier update/control over ansible-runner dependencies like kubectl, helm, etc.

```bash
# cd into this directory
./image_helper.sh build 	#Builds Docker Image
./image_helper.sh package	#Packages Docker Image into .tar.gz
./image_helper.sh load		#Loads .tar.gz
```

If the Dockerfile gets updated, increment the version in image_helper.sh