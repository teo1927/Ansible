#!/bin/bash
ABSPATH=$(readlink -f "$0") #Absolute Path Of where The Script Sits
ABSDIR=$(dirname "$ABSPATH") #Directory Where The Script Is Running From
newdir="/opt/Ansible-Projects/"
firstprojectdir="/opt/Ansible-Projects/My-Projects/New-Ansible-Project/"
myprojectdir="/opt/Ansible-Projects/My-Projects/"
file="Ansible-Projects.zip"
zipfile="$newdir$file"

yum -y install epel-release > /dev/null 2>&1
if [ $? -eq 0 ] ; then 
  echo 'EPEL ................................ Installed' ;
  else echo 'EPEL ................................ ERROR';
  echo 'Error Installing epel-release';
  exit ;
  fi
yum -y install ansible > /dev/null 2>&1
if [ $? -eq 0 ] ; then 
  echo 'Ansible ............................. Installed' ;
  else echo 'Ansible ............................. ERROR';
  echo 'Error Installing ansible';
  exit ;
  fi
yum -y install python3 > /dev/null 2>&1
if [ $? -eq 0 ] ; then 
  echo 'Python3 ............................. Installed' ;
  else echo 'Python3 ............................. ERROR';
  echo 'Error Installing python3';
  exit ;
  fi
yum -y install unzip > /dev/null 2>&1
if [ $? -eq 0 ] ; then 
  echo 'Unzip ............................... Installed' ;
  else echo 'Unzip ............................... ERROR';
  echo 'Error Installing unzip';
  exit ;
  fi
yum -y install git > /dev/null 2>&1
if [ $? -eq 0 ] ; then 
  echo 'Git ................................. Installed' ; 
  else echo 'Git ................................. ERROR';
  echo 'Error Installing git';
  exit ;
  fi
git clone https://github.com/teo1927/Ansible-Quick-Start-Setup.git "$newdir"
unzip "$zipfile" -d "$newdir"
mkdir "${newdir}My-Projects/.New-Project-Template"
cp -R "$firstprojectdir" "${myprojectdir}.New-Project-Template/"
mkdir "${newdir}.Setup-Projects"
cp -R "${newdir}Setup-Projects/" "${newdir}.Setup-Projects/"
rm -f "$zipfile"
rm -f "${ABSDIR}/Ansible-Quick-Start.sh"
rm -f "${newdir}/README.md"
rm -rf "${newdir}Setup-Projects/"
ansible-playbook -i /opt/Ansible-Projects/.Setup-Projects/Setup-Projects/Jenkins-Server/inventories/staging/hosts /opt/Ansible-Projects/.Setup-Projects/Setup-Projects/Jenkins-Server/site.yml
ansible-playbook -i /opt/Ansible-Projects/.Setup-Projects/Setup-Projects/VS-Code-Server/inventories/staging/hosts /opt/Ansible-Projects/.Setup-Projects/Setup-Projects/VS-Code-Server/site.yml

externalip=$(curl ifconfig.co)
jenkinslogin=$(docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword)
echo " "
echo "+------------------------------------------+"
echo "| Service Information"
echo "|"
echo "| Ansible Workspace:"
echo "| /opt/Ansible-Projects"
echo "|"
echo "| Virtual Studio Code:"
echo "| http://${externalip}:8443/?folder=/opt"
echo "|"
echo "| Jenkins Dashboard:"
echo "| http://${externalip}:8080"
echo "| Password: ${jenkinslogin}"
echo "+------------------------------------------+"
echo "Installation Complete"
