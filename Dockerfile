FROM ubuntu:latest

RUN apt update
RUN apt install -y sudo wget
RUN useradd -m user ; adduser user sudo ; echo user:root | sudo chpasswd
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb ; dpkg --install chrome-remote-desktop_current_amd64.deb ; apt install -y --fix-broken
RUN DEBIAN_FRONTEND=noninteractive apt install -y xfce4 desktop-base xfce4-terminal ; bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session' ; apt install -y xscreensaver
RUN adduser user chrome-remote-desktop
RUN su - user -c 'DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWi_4tQ_zx-9TP-eO5XPtCCGf9useNkd_u2KYMu6s8wTSk65cFBgRXjdvTfnJ_5r5g" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=123456' ; service chrome-remote-desktop start

USER user

COPY . .

CMD ls
