# !/bin/bash

#If you have a Kali distribution you don't have to follow this script as probably you'll have the most part of these tools, but if you don't have it, you can install it with the commands in TUTORIAL_OSINT.md

sudo apt-get update && upgrade

# Install whatweb, dnsenum and whois
sudo apt-get install -y whatweb dnsenum  whois


# Install theHarvester
sudo apt-get install -y git
git clone https://github.com/laramies/theHarvester.git
sudo apt-get install -y python3-pip
cd theHarvester
sudo pip3 install -y -r requirements.txt

#To run theHarvester you'll have to be inside the folder that you downloaded (theHarvester's folder in the directory where you run this script) and run in the terminal: python3.7 theHarvester.py -h 



