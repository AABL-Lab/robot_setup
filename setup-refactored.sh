#!/bin/bash
################################################################################
##            ____       _ _   ____    ____       _                           ##
##           |  _ \ ___ | (_) |___ \  / ___|  ___| |_ _   _ _ __              ##
##           | |_) / _ \| | |   __) | \___ \ / _ \ __| | | | '_ \             ##
##           |  __/ (_) | | |  / __/   ___) |  __/ |_| |_| | |_) |            ##
##           |_|   \___/|_|_| |_____| |____/ \___|\__|\__,_| .__/             ##
##                                                         |_|                ##
################################################################################

################################################################################
## A. INTRODUCTION
################################################################################
 # This script contains all the commands you need to set up a new
 #   COMPUTER OR USER ONBOARD POLI 2
 # or for a new
 #   DEV COMPUTER OR USER WORKING WITH POLI 2.
 #
 # This script contains everything from instructions on how to install ROS, all
 # the way to automatically setting your desktop background.
 # This is "One setup script to rule them all", if you will.

 # HOW TO USE THIS FILE:
 #   1. Start at Part E: VARIABLES and follow the instructions.
 #   2. Go to Part F: COMMANDS
 #     a. Read, or at least skim, all the command sections
 #     b. If you want to run a certain set of commands, un-comment it by
 #        removing the # at the start of the line. Lines with two hashes (##)
 #        are instructions, lines with one hash are commands you can uncomment.
 #   5. Remove or comment out the Blocker at the start of Part D.
 #   6. The file is now ready to run.
 #   7. If a step does not run, fix it.
 #     a. If you cannot fix it, leave a note as a comment that it may not work
 #     b. If it already has a comment that it doesn't work, and you can't fix
 #         it, remove it since you've verified that it doesn't work.
 #   8. If you have to run more commands that aren't in this file, add them
 #      to this file along with documentation.
 #   9. Commit and push your changes to the script immediately after using it
 #      (but do not commit the un-commenting changes you made). You may want to
 #      do this by simply editing the script using the GitHub web interface
 #      rather than having to re-comment out all the lines before committing.

################################################################################
## B. AUTHOR AND COPYRIGHT INFORMATION
################################################################################
  # Authors:
  # - Elaine Short
  # - Adam Allevato

  # Copyright 2019 The Authors (see above)
  # Copyright 2019 Socially Intelligent Machines Lab
  # Copyright 2019 The University of Texas at Austin
  # All rights reserved.
  #
  # Redistribution and use in source and binary forms, with or without
  # modification, are permitted provided that the following conditions are met:
  #
  # * Redistributions of source code must retain the above copyright notice,
  #   this list of conditions and the following disclaimer.
  #
  # * Redistributions in binary form must reproduce the above copyright notice,
  #   this list of conditions and the following disclaimer in the documentation
  #   and/or other materials provided with the distribution.
  #
  # * Neither the name of the copyright holder nor the names of its
  #   contributors may be used to endorse or promote products derived from
  #   this software without specific prior written permission.
  #
  # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  # AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  # IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  # ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  # LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  # CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  # SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  # INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  # CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  # ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  # POSSIBILITY OF SUCH DAMAGE.

################################################################################
## C. WHY IS THIS FILE SET UP THE WAY IT IS?
################################################################################
  # Short answer: because we tried everything else and this seemed like the best
  # way to do a set up script. Nothing else worked well as a permanent solution.

  # Long answer:
  #
  # There are a few different ways to maintain a consistent robot
  # infrastructure, that is, to have code that automatically configures a robot
  # computer. This type of problem is often called Infrastructure as Code, or
  # IaC. The idea is to never have to type commands such as `apt-get install`
  # into the terminal directly, because if you do that, the fact that you did it
  # is not captured anywhere. When someone else faces the same problem (or when
  # you yourself face the same problem at a later date) there is no
  # documentation of how to fix it. Therefore, using IaC, all configuration
  # steps should be captured in a single file so that no memory is involved.
  #
  # Unfortunately, while IaC works well for huge companies and companies that
  # need to automatically spin up up dozens or hundreds of servers, it does not
  # work well in an academic setting. There are several reasons for this,
  # primarily:
  #   1. Robot configurations change often (for every experiment)
  #   2. Not all functionality is needed for every experiment or robot
  #   3. New robots are not created from scratch often enough to ensure
  #      that everyone knows how to use an array of setup scripts
  #   4. New students who are still learning the system are confused or misled
  #      by the existence of several different forms of setup instructions:
  #      documentation, tutorials, and scripts.
  #
  # Because of this, we have opted for this script file, which is designed to
  # be extensible, self-teaching, self-contained, and self-documenting. It
  # addresses the problems listed above:
  #   1. Rather than a hierarchical structure, the linear structure of this
  #      script keeps it composible and flexible for different robot configs
  #   2. See above
  #   3. There is no other tutorial or documentation. This file is the only
  #      source of setup instructions. It is the one and only piece of setup
  #      infrastructure. All students must use it when setting up a new computer
  #   4. This script does nothing by default. You MUST read at least some of
  #      this file (and edit it) to use it, which hopefully means you learn
  #      *why* you're doing what you're doing.
  #
  # This script is intended to allow for maximum
  # transparency and flexibility in the setup, as well as to ensure
  # that new users (especially undergrads) actually look at and
  # attempt to understand the commands contained in this file.
  # There are certainly more efficient ways to do this, but we
  # decided that all of them would be too brittle or too opaque
  # for a research lab.
  #
  # You may have rejected the arguments presented above, and still feel that
  # there is a better way to set up and provision robotics computers. It's
  # possible that some new technology or method was invented since 2019 when
  # this file was created that somehow is immune to the problems listed above,
  # but it's extremely unlikely. This is an experiment but we truly believe it's
  # the best option possible given what we've tested.
  #
  # If you've read this far in this boring, boring answer, I know that your
  # personality is like mine. You want to know the best way to do something.
  # Well, know that we have collectively spent dozens of hours thinking about
  # this problem and iterating on it. We've tried every other solution we can
  # think of, and none of them have been clean. Do yourself a favor and don't
  # bother trying to come up with a better way to do this unless you're willing
  # to put a ton of time into it. Will that really help you graduate?
  #
  # You may also want to read the following article, which partially inspired
  # this script:
  # https://blog.danslimmon.com/2019/07/15/do-nothing-scripting-the-key-to-gradual-automation/

################################################################################
## D. PRELIMINARIES
################################################################################
##------------------------------------------------------------------------------
## Blocker
## Stops the script from running if you haven't read it.
## Comment out this section to actually run the file.
##------------------------------------------------------------------------------

echo "Please read and edit this setup script before running it."
read -p "Press enter to exit."
exit 1

##------------------------------------------------------------------------------
## (End of Blocker)
## Bash Definitions
##------------------------------------------------------------------------------
set -ev

##------------------------------------------------------------------------------
## A basic check to get sudo permission early
##------------------------------------------------------------------------------
sudo echo "Now running with superuser permissions"

##------------------------------------------------------------------------------
## A basic check to the user to make sure this will work.
##------------------------------------------------------------------------------
echo "You must have a GitHub user account with pull access to the" \
     " AABL-Lab organization."
read -p "Press enter to continue with installation. It may take some time."


##------------------------------------------------------------------------------
## Force starting in the home directory
##------------------------------------------------------------------------------
cd ${HOME}

##------------------------------------------------------------------------------
## Basic Utilities
## Prepare your apt repository and install crucial dependencies
##------------------------------------------------------------------------------
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -yq \
  apt-transport-https \
  apt-utils \
  wget \
  curl

################################################################################
## E. VARIABLES
################################################################################

##------------------------------------------------------------------------------
## This is where your ROS packages will go. If you'd like, you can change this,
## but we suggest using the default.
##------------------------------------------------------------------------------
WORKSPACE_PATH="${HOME}/catkin_ws/src"


################################################################################
## F. COMMANDS
################################################################################
##------------------------------------------------------------------------------
## Install ROS
## The commands below will install ROS Kinetic.
## These are the same steps that are listed at the website
## http://wiki.ros.org/kinetic/Installation/Ubuntu.
## Also installs catkin tools, which is a better version of catkin_make
## Required for all machines and users.
##------------------------------------------------------------------------------
#sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
#curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
#sudo apt-get update
#sudo apt-get install -yq \
#  python-catkin-tools \
#  python-wstool \
#  python-vcstool \
#  python-pip \
#  ros-kinetic-desktop-full
#sudo rm -f /etc/ros/rosdep/sources.list.d/20-default.list
#sudo rosdep init
#rosdep update --include-eol-distros
#source /opt/ros/kinetic/setup.bash

## Install other ROS-specific system dependencies
#sudo apt-get install -yq \
#  libusb-1.0-0 

##------------------------------------------------------------------------------
## Quality-of-life tools and settings
## Highly recommended for all machines.
##------------------------------------------------------------------------------
## For mobile bases, can be useful on development machines too:
## These packages allow easily teleoperating the robot using the keyboard or a
## joystick.
#sudo apt-get install -yq \
#  ros-kinetic-teleop-twist-joy \
#  ros-kinetic-teleop-twist-keyboard

## Required to communicate with peripherals such as the face LEDs.
#sudo apt-get install -yq \
#  ros-kinetic-rosserial-python

## chrony ensures your clock is synchronized with the others on the network
#sudo apt-get install -yq chrony

## Code editors
## Dependencies for Sublime Text editor (from https://www.sublimetext.com/docs/3/linux_repositories.html#apt)
#wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
## visual studio code editor (from https://code.visualstudio.com/docs/setup/linux)
#sudo snap install --classic code
## now install everything
#sudo apt-get update
#sudo apt-get install -yq \
#  curl \
#  emacs \
#  geany \
#  sublime-text \
#  terminator \
#  vim
## Set the default settings for gedit to be OK for programming
#gsettings set org.gnome.gedit.preferences.editor auto-indent true
#gsettings set org.gnome.gedit.preferences.editor bracket-matching true
#gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
#gsettings set org.gnome.gedit.preferences.editor highlight-current-line true
#gsettings set org.gnome.gedit.preferences.editor insert-spaces true
#gsettings set org.gnome.gedit.preferences.editor tabs-size "uint32 2"

## Git
## A nice graphical Git client
#sudo apt install gitk
## Set the git cache to timeout after 1 hour (setting is in seconds)
#git config --global credential.helper 'cache --timeout=3600'
## Set up your Git login
#git config --global user.email "${USER}@${HOSTNAME}"
#git config --global user.name "${USER} @ ${HOSTNAME}"

## Increase scrollback limit in Terminator
#mkdir -p ${HOME}/.config/terminator/
#echo "[profiles]
#  [[default]]
#    scrollback_infinite = True
#    scroll_on_output = False
#" > ${HOME}/.config/terminator/config

## Allow SSH into this machine
## required for robot machines
#sudo apt-get install -yq openssh-server

##------------------------------------------------------------------------------
## Create Workspace
## These commands create a catkin workspace in your home directory (or somewhere
## else if you changed the $WORKSPACE PATH earlier).
## After these commands, the working directory should be the source folder.
## Required for all machines and users.
##------------------------------------------------------------------------------
#if [ -d "${WORKSPACE_PATH}" ]
#then
#  echo "Your workspace directory (${WORKSPACE_PATH}) already exists."
#  echo "IF YOU CONTINUE THE SCRIPT, YOUR WORKSPACE DIRECTORY WILL BE DELETED."
#  read -p "Press enter to continue."
#  rm -rf $WORKSPACE_PATH
#fi

#mkdir -p $WORKSPACE_PATH
#cd $WORKSPACE_PATH

##------------------------------------------------------------------------------
## Clone all of the relevant repositories using vcstool
#vcs import --input https://raw.githubusercontent.com/AABL-Lab/robot_setup/master/rosinstall/full_robot.vcsinstall

##------------------------------------------------------------------------------
## Onboard Robot Machine Setup (Main Acount)
## Install udev rules. udev rules allows our launch files to find peripherals
## like the head motors, gripper, and camera.
## Required, but ONLY for the "main" account on an onboard robot machine.
## DO NOT use for other accounts on these computers or for development machines.
## i.e. run it on moe@moe1 and barton@barton2, but not adam@moe1 or taylor@lupe2.
##------------------------------------------------------------------------------
## add udev rule for kinova arm
#sudo ln -sf ${WORKSPACE_PATH}/kinova-ros/kinova_driver/udev/10-kinova-arm.rules \
#  /etc/udev/rules.d/10-kinova-arm.rules
## Add udev rule for epos motor
#sudo ln -sf ${WORKSPACE_PATH}/epos_hardware/epos_hardware/90-ftd2xx.rules \
#  /etc/udev/rules.d/90-ftd2xx.rules
## Other peripherals
#sudo ln -sf ${HOME}/robot_setup/udev/udev.rules \
#  /etc/udev/rules.d/10-local.rules

## Refresh the UDEV rules
#sudo udevadm control --reload-rules
#sudo udevadm trigger

##------------------------------------------------------------------------------
## Post-Code Steps
## Required for all machines and users
##------------------------------------------------------------------------------
## Automatically find and install needed dependencies
#rosdep install --from-paths . --ignore-src --rosdistro=kinetic -y

## Build your workspace
#cd ..
#catkin build

## assuming that the build completed, source your workspace
#source devel/setup.bash

## Add useful shortcuts to your bashrc so they are automatically accessible
## For more details, read shortcuts.bash (at the path below).
#echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
#WORKSPACE_ROOT="$(dirname "$WORKSPACE_PATH")"
#echo "source ${WORKSPACE_ROOT}/devel/setup.bash" >> ~/.bashrc
#echo "source ${HOME}/robot_setup/shortcuts.bash" >> ~/.bashrc

## You're done with this section! Go back to the top of the file and continue
## the instructions. Or, if you see this command while running the setup
## script, you've completed the setup process. Restart your computer.
