# SIM Lab Machine Setup
This repository has information on how to get setup to develop on or with the robots.

# Setup Steps

1. Make sure your user is a sudoer (if you are not the admin, log in as the admin and 
   ```
   sudo adduser <yourusername> adm sudo dialout audio lpadmin sambashare  
   ```
    and then restart the computer)
1. make an ssh key (ssh keygen)
1. Add your ssh **PUBLIC** key to your github account
1. On the robot computer only, run eval$(ssh-agent) to start a new ssh agent
1. run ssh-add at the command line to authenticate for the entire terminal session
1. Run the following commands in a new terminal:
    ```
    sudo apt-get install -yq git
    git clone git@github.com:AABL-Lab/robot_setup.git 
    ```
1. Run `gedit robot_setup/setup.sh` to open the setup script in a text editor.
1. Follow the instructions in the setup script to edit it.
1. Don't forget to save!
1. Run `bash robot_setup/setup.sh` to run the setup.
1. Restart the computer.
