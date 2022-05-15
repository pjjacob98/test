FROM ubuntu:latest

RUN apt update
RUN apt install -y sudo wget
RUN useradd -m user ; adduser user sudo ; echo user:root | sudo chpasswd
RUN systemctl disable lightdm.service
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb ; dpkg --install chrome-remote-desktop_current_amd64.deb ; apt install -y --fix-broken
RUN DEBIAN_FRONTEND=noninteractive apt install -y xfce4 desktop-base xfce4-terminal ; bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session' ; apt install -y xscreensaver
RUN adduser user chrome-remote-desktop
USER user

COPY . .

CMD ["bash", "start.sh"]
