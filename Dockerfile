# Utilisation de l'image officielle Jenkins
FROM jenkins/jenkins:latest

# Définition de l'utilisateur root pour éviter les problèmes de permissions
USER root

# Installation de Docker CLI
RUN apt-get update && \
    apt-get install -y apt-transport-https \
                       ca-certificates \
                       curl \
                       gnupg-agent \
                       software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y docker-ce-cli

# Création du groupe "docker"
RUN groupadd docker

# Ajout de l'utilisateur jenkins au groupe "docker"
RUN usermod -aG docker jenkins

# Revenir à l'utilisateur jenkins
USER jenkins
