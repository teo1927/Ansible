#!/bin/bash
BASEDIR=$(dirname $0)
ABSPATH=$(readlink -f $0) #Absolute Path Of where The Script Sits
ABSDIR=$(dirname $ABSPATH) #Directory Where The Script Is Running From
newdir="${ABSDIR}/Ansible-Projects/"
file="Ansible-Quick-Start.zip"
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
git clone https://github.com/teo1927/Ansible-Quick-Start-Setup.git $newdir
unzip $zipfile -d $newdir
mkdir "${ABSDIR}/Ansible-Projects/.New-Project-Template"
cp -R ${newdir}Ansible-Quick-Start/ ${newdir}.New-Project-Template/
rm $zipfile
rm -f "${ABSDIR}/Ansible-Quick-Start.sh"
rm -f "${ABSDIR}/README.md"
