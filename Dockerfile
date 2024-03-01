FROM mcr.microsoft.com/vscode/devcontainers/cpp:ubuntu-20.04
USER root
RUN apt update -y && apt upgrade -y

# Install bsic packages
RUN apt install -y tmux firefox curl git vim nano gnupg software-properties-common apt-transport-https wget

# Get ros gpg key
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# Add ros repo
RUN echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list
# Get Microsoft gpg key
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
# Add VScode repo
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Install ros noetic, catkin and VScode
#### You can add more ros packages permanently by adding them here #### 
RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends ros-noetic-desktop-full python3-catkin-tools code ros-noetic-teleop-twist-keyboardros-noetic-grid-map

# Source the ros setup file
RUN echo "source /opt/ros/noetic/setup.bash" >> $HOME/.bashrc
RUN echo "set -g mouse on" >> $HOME/.tmux.conf

#### Uncomment and set your base directory here ####
# WORKDIR $HOME

# Workaround to keep container alive
CMD tail -f /dev/null

