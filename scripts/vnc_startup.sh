#!/bin/bash

#resolve_vnc_connection
VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
VNC_PORT="590"${DISPLAY:1}

##change vnc password
echo "change vnc password!"
su - vncuser -c "(echo $VNC_PW && echo $VNC_PW) | vncpasswd"

##start vncserver and noVNC webclient
su - vncuser -c "vncserver -kill :1"
su - vncuser -c "vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION"
sleep 1
##log connect options
echo -e "\n------------------ VNC environment started ------------------"
echo -e "\nVNCSERVER started on DISPLAY= $DISPLAY \n\t=> connect via VNC viewer with $VNC_IP:$VNC_PORT"
