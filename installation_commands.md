# 🚀 DevOps Tools Setup Guide

This document contains installation steps for the tools used in the **Blue-Green Deployment DevOps Pipeline**.

---

# 1️⃣ Install AWS CLI

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
```

### Configure AWS
```bash
aws configure
aws sts get-caller-identity
```

---

# 2️⃣ Install Terraform

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

### Add HashiCorp GPG Key
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```

### Add Terraform Repository
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com \
$(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" \
| sudo tee /etc/apt/sources.list.d/hashicorp.list
```

### Install Terraform
```bash
sudo apt update
sudo apt-get install terraform
```

---

# 3️⃣ Clone Project Repository

```bash
git clone https://github.com/pankajmasaye88/Blue-Green-Deployment.git
```

---

# 4️⃣ Install Jenkins

### Install Java
```bash
sudo apt update
sudo apt install fontconfig openjdk-21-jre
java -version
```

### Add Jenkins Repository
```bash
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
```

```bash
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
```

### Install Jenkins
```bash
sudo apt update
sudo apt install jenkins
```

---

# 5️⃣ Install Docker

### Add Docker GPG Key
```bash
sudo apt update
sudo apt install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

### Add Docker Repository
```bash
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF
```

### Install Docker
```bash
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Verify Docker
```bash
sudo systemctl status docker
```

### Add Users to Docker Group
```bash
sudo usermod -aG docker $USER && newgrp docker
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
```

---

# 6️⃣ Run DevOps Tools Using Docker

### Nexus Repository
```bash
docker run -d -p 8081:8081 sonatype/nexus3
```

### SonarQube
```bash
docker run -d -p 9000:9000 sonarqube:lts-community
```

---

# 7️⃣ AWS EKS Infrastructure Resources

Terraform creates the following AWS resources:

```
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
```

---

# 8️⃣ Install Trivy (Container Security Scanner)

```bash
sudo apt-get install wget gnupg
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null
```

```bash
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] \
https://aquasecurity.github.io/trivy-repo/deb generic main" | \
sudo tee -a /etc/apt/sources.list.d/trivy.list
```

```bash
sudo apt-get update
sudo apt-get install trivy
```

---

# 9️⃣ Install kubectl

```bash
sudo snap install kubectl --classic
kubectl version --client
```

---

# 📌 Tools Used in This Project

- AWS CLI
- Terraform
- Jenkins
- Docker
- Nexus
- SonarQube
- Trivy
- Kubernetes (kubectl)

---

# 🔵 Project Repository

GitHub Repo:

```
https://github.com/pankajmasaye88/Blue-Green-Deployment
```

---
