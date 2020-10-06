# Develop First, Deploy Later
## Ansible-Quick-Start.sh
This Script Creates A Pre-Configured Developer Environemt Utilizing Docker Containers To House Cutting Edge Automation Software. The Services Include Automation Applications Such As Ansible and Jenkins And respective Community Projects created by contributers to the platform. The Services are aimed towards lessening the spin up time of production environments and encourage mobile collaboration of automation/pipelining libraries. All Services are easily accessable via browser due to the container and host shared file system. All edits are possible via virtual studio code in your web browser allowing for off prem collaboration and usablility.

## Features
- **Ansible Quick Start directory structure contains best practice environment for efficient horizontal scaling**
![](images/Directory-Structure.png)
- Virtual Studio Code allows access and collaboration from any machine via web browser
- Jenkins continuous integration suite shares the same file system as the other automation services

## Centos Distributions ONLY

## Usage
### Initial Setup
`bash <(curl -fsSL https://raw.githubusercontent.com/teo1927/Ansible/master/Ansible-Quick-Start.sh)`
#### New Project
`bash New-Project.sh <Project_Name>`
#### New Role
`bash New-Role.sh <Role_Name>`
## Requisites
1. Root Privleges
2. Centos Operating System
3. Internet Connection
