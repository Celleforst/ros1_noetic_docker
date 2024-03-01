# ros1_noetic_docker
I created this docker container set up to run ros1 on Linux with gui application support. The existing docker images don't work out of the box since the keys are somehow too old or whatever... So I decided to create my own image with ros noetic build on top of a ubuntu 20.04 image

# Prerequisites
Use X11 or install Xwayland when running on wayland
Run xhost +local:* to allow x-server connection
You probably need docker rootless for it to work properly

# Customization
The main things to customize can be found in the Dockerfile. There you can add packages permanently to the container by adding them to the apt install command and you can also set your working directory. By default your users home folder is shared with the container. I tried implementing a non-root user in the container but could not get that to work whilst still being able to open gui applications.

# Running the container
You basically have to build/rebuild the image every time you change something in the Dockerfile or in the docker-compose file. This takes a while because the ros_noetic download takes quite some time.
## Building the image
To build the image just run docker-compose up -d --build
## Opening and closing the container
To open the container and enter its bash you can simply run ./start_env
To Close the container run ./stop_env (if you just close the window the container will continue to run in the background)
## Workflow inside the container
I usually used tmux to have multiple terminals in only one window. From there you can just open applications normally from the terminal and they should open just fine.
