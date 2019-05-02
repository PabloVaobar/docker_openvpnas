# =======================================================
# NAME: dockerfile
# AUTHOR: PabloVaobar
#
# dockerfile docker_openvpnas
# Docker OpenVPN simple
# =======================================================

#Choix de la distribution
FROM ubuntu:latest

#Mise à jour de la distribution
RUN apt-get -y update && \
		apt-get -y upgrade && \
		apt-get -y dist-upgrade && \
		do-release-upgrade

#Installation OpenVPN
RUN apt-get -y install openvpn

#Préparation de l'installation d'OpenVPNAS
	#Téléchargement d'OpenVPNAS
	RUN apt-get -y install wget && \
			wget https://openvpn.net/downloads/openvpn-as-latest-ubuntu18.amd_64.deb
			
	#Installation des dépendances
	RUN apt-get -y install iptables
	
#Installation OpenVPNAS
RUN dpkg -i openvpn-as-latest-ubuntu18.amd_64.deb

#Configuration User
echo -e "password\npassword" | passwd openvpn
	
# Nettoyage
RUN rm openvpn-as-latest-ubuntu18.amd_64.deb && \
		apt-get -y remove wget && \
		apt-get -y autoremove
		
