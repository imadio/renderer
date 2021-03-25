
# X Server
  Xvfb :1 -screen 0 800x600x16 &
# Openbox
  (export DISPLAY=:1 && openbox-session) &
# VNC Server
  if [ -z $VNC_PASSWD ]; then
    # no password
    x11vnc -display :1 -xkb -forever;
  else
    # set password from VNC_PASSWD env variable
    mkdir ~/.x11vnc &&
    x11vnc -storepasswd $VNC_PASSWD /root/.x11vnc/passwd &&
    x11vnc -display :1 -xkb -forever -rfbauth /root/.x11vnc/passwd &
  fi