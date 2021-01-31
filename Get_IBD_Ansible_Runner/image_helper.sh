#!/usr/bin/env bash
set -e #stops the execution of a script if a command has an error

export version="1.4.6-bb.1" #Based on Ansible Runner 1.4.6, but customized so following BB Charter Convention
export name="ironbank-derived-ansible-runner"

help () {
    echo "
Usage: image_helper.sh [function]

Functions:
    build       Builds Docker Image
    package     Packages Built Image to .tar.gz
    load        Loads Built Image from .tar.gz
    *           Help"
}


build () {
docker image ls | grep $name | grep $version > /dev/null && sleep 0 
if [ $? -eq 0 ]
then
    echo "Nothing to do, docker image ls found: $name version: $version"
else
    echo "I'll take about 12m11sec to build"
    docker build -t $name:$version .
fi
# debug: docker image rm ironbank-derived-ansible-runner:1.4.6-bb.1
}


package () {
check_size_of_targz
ls | grep "$name-$version.tar.gz" > /dev/null && sleep 0
TARGZ_EXISTS=$?
if [ $TARGZ_EXISTS -eq 0 ]
then
    echo "Nothing to do, ls found: \"$name-$version.tar.gz\""
else
    echo "Packaging... I am not frozen, give me about 3m"
    docker save $name:$version | gzip > $name-$version.tar.gz
fi
check_size_of_targz
}


load () {
check_size_of_targz
docker image ls | grep $name | grep $version > /dev/null && sleep 0
IMAGE_EXISTS=$?
ls | grep "$name-$version.tar.gz" > /dev/null && sleep 0
TARGZ_EXISTS=$?
if [ $IMAGE_EXISTS -eq 0 ] 
then
    echo "Nothing to do, docker image ls found: $name version: $version"
elif [ $TARGZ_EXISTS -eq 0 ] 
then
	echo "Loading .tar.gz... I'm not frozen, the next command will take about 1 min"
    cat $name-$version.tar.gz | docker import - $name:$version
    echo "Running the following verification command:"
    echo "docker image ls | grep $name | grep $version"
    docker image ls | grep $name | grep $version
else # image wasn't found and .tar.gz wasn't found
    echo """Error: Couldn't find $name-$version.tar.gz 
       Resolution:
       1. Login to IronBank via the Docker CLI
       2. run './image_helper.sh build' to rebuild the image
       3. run './image_helper.sh package' to generate $name-$version.tar.gz
       4. rerun './image_helper.sh load'"""
fi
# Debug:
# docker image ls | grep ansible
# docker image rm ironbank-derived-ansible-runner:1.4.6-bb.1
# docker image ls | grep ansible
}

check_size_of_targz () {
ls | grep "$name-$version.tar.gz" > /dev/null && sleep 0
IMAGE_EXISTS=$?
if [ $IMAGE_EXISTS -eq 0 ]
then
    TARGZ_SIZE=$(wc -c <"$name-$version.tar.gz")
    if [ $TARGZ_SIZE -le 100 ]
    then
        echo """Error: Your tar.gz looks too small to be a docker image
           Resolution:
           1. run 'rm $name-$version.tar.gz' to remove the image from docker
           2. run 'docker image rm $name:$version' to remove the .tar.gz
           3. Login to IronBank via Docker CLI 'docker login https://registry1.dso.mil'
           4. run './image_helper.sh build' to rebuild the image
           5. run './image_helper.sh package' to generate $name-$version.tar.gz
           6. rerun './image_helper.sh load'"""
        exit
    fi
fi
}

case "$1" in
	build)
		build
		;;
	package)
		package
		;;
	load)
		load
		;;
	*)
		help
esac
