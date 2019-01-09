#!/bin/bash

__create_user() {
# Create a user to SSH into as.
SSH_USER=hudson
SSH_PASS=redhat
useradd $SSH_USER
echo "$SSH_PASS" | passwd $SSH_USER --stdin
echo "ssh $SSH_USER password: $SSH_PASS"

echo 'export JAVA_HOME=/usr/lib/jdk-last' >> /home/hudson/.profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/hudson/.profile
echo '' >> /home/hudson/.profile
echo 'export JAVA_HOME=/usr/lib/jdk-last' >> /home/hudson/.bash_profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /home/hudson/.bash_profile
echo '' >> /home/hudson/.bash_profile
}

# Call all functions
__create_user