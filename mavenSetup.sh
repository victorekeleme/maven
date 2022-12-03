#!/bin/bash

#VARIABLES
PACKAGES="wget unzip git-all"
JAVAPACKAGES=( "java-1.8.0-openjdk-devel.x86_64" "java-11-openjdk-devel.x86_64" )
GIT="git-all" 


echo #############################################
echo ############### MAVEN SETUP #################
echo #############################################

sudo mkdir /opt
cd /opt


echo #############################################
echo ########## PREPARING ENVIRONMENT ############
echo #############################################

sudo yum install $PACKAGES -y

java --version

if [ $? -eq 0 ]
then
	echo "Java Already Installed"
else
	echo "Installing Java"
	sudo yum install java-1.8.0-openjdk-devel.x86_64 java-11-openjdk-devel.x86_64 -y
fi

git --version

if [ $? -eq 0 ]
then
        echo "Git Already Installed"
else
	echo "Installing Git"
       	sudo yum install git-all -y &> /dev/null
fi


echo #############################################
echo ########### MAVEN INSTALLATION ##############
echo #############################################

sudo wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip &> /dev/null

sudo unzip apache-maven-3.8.6-bin.zip &> /dev/null

sudo rm -rf apache-maven-3.8.6-bin.zip

sudo mv /opt/apache-maven-3.8.6/ maven


echo #############################################
echo ###### SETTING ENVIRONMENT VARIABLES ########
echo #############################################

echo 'export M2_HOME=/opt/maven' >> ~/.bash_profile
echo 'export PATH=$PATH:$M2_HOME/bin' >> ~/.bash_profile


source ~/.bash_profile

echo "MAVEN SETUP COMPLETED"



