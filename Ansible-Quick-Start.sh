#!/bin/bash
ABSPATH=$(readlink -f "$0") #Absolute Path Of where The Script Sits
ABSDIR=$(dirname "$ABSPATH") #Directory Where The Script Is Running From
newdir="${ABSDIR}/Ansible-Projects/"
firstprojectdir="${ABSDIR}/Ansible-Projects/My-Projects/New-Ansible-Project/"
myprojectdir="${ABSDIR}/Ansible-Projects/My-Projects/"
file="Ansible-Projects.zip"
zipfile="$newdir$file"
echo "$ABSDIR"
echo "$newdir"
yum -y install epel-release
if [ $? -eq 0 ] ; then 
  echo 'Extra Packages for Enterprise Linux Installed' ;
  else echo 'Error Installing Extra Packages for Enterprise Linux';
  exit ;
  fi
yum -y install ansible
if [ $? -eq 0 ] ; then 
  echo 'Ansible Installed' ;
  else echo 'Error Installing Ansible';
  exit ;
  fi
yum -y install python3
if [ $? -eq 0 ] ; then 
  echo 'Python3 Installed' ;
  else echo 'Error Installing Python3';
  exit ;
  fi
yum -y install unzip
if [ $? -eq 0 ] ; then 
  echo 'Unzip Installed' ;
  else echo 'Error Installing Unzip';
  exit ;
  fi
yum -y install git
if [ $? -eq 0 ] ; then 
  echo 'Git Installed' ; 
  else echo 'Error Installing Git';
  exit ;
  fi
git clone https://github.com/teo1927/Ansible-Quick-Start-Setup.git "$newdir"
unzip "$zipfile" -d "$newdir"
mkdir "${newdir}My-Projects/.New-Project-Template"
cp -R "$firstprojectdir" "${myprojectdir}.New-Project-Template/"
#mkdir "${newdir}.Setup-Projects"
cp -R "${newdir}Setup-Projects/" "${newdir}.Setup-Projects/"
#rm -rf "${newdir}Setup-Projects/"
rm -f "$zipfile"
rm -f "${ABSDIR}/Ansible-Quick-Start.sh"
rm -f "${newdir}/README.md"
