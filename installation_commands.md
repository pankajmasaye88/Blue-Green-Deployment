curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install

aws configure
aws sts get-caller-identity

*************************************************************

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform


git clone https://github.com/pankajmasaye88/Blue-Green-Deployment.git

***********************************************************

sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install Jenkins

****************************************************

# Add Docker's official GPG key:
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update


sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl status docker

sudo usermod -aG docker $USER && newgrp docker
sudo usermod -aG docker Jenkins
sudo systemctl restart jenkins

**********************************************************************************

docker run -d -p 8081:8081 sonatype/nexus3

docker run -d -p 9000:9000 sonarqube:lts-community

***************************************************************************
aws_eks_cluster.pankajm  
aws_eks_node_group.pankajm  
aws_iam_role.pankajm_cluster_role  
aws_iam_role.pankajm_node_group_role  
aws_iam_role_policy_attachment.pankajm_cluster_role_policy  
aws_iam_role_policy_attachment.pankajm_node_group_cni_policy  
aws_iam_role_policy_attachment.pankajm_node_group_registry_policy  
aws_iam_role_policy_attachment.pankajm_node_group_role_policy  
aws_internet_gateway.pankajm_igw  
aws_route_table.pankajm_route_table  
aws_route_table_association.a[0]  
aws_route_table_association.a[1]  
aws_security_group.pankajm_cluster_sg  
aws_security_group.pankajm_node_sg  
aws_subnet.pankajm_subnet[0]  
aws_subnet.pankajm_subnet[1]  
aws_vpc.pankajm_vpc 

*******************************************************************************

sudo apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy

***************************************************************
sudo snap install kubectl --classic
kubectl version --client

****************************************

