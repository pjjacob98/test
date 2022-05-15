FROM ubuntu:latest

RUN apt update
RUN apt install -y sudo wget
RUN useradd -m user ; adduser user sudo ; echo user:root | sudo chpasswd
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb ; dpkg --install chrome-remote-desktop_current_amd64.deb ; apt install -y --fix-broken
RUN DEBIAN_FRONTEND=noninteractive apt install -y xfce4 desktop-base xfce4-terminal ; bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session' ; apt install -y xscreensaver
RUN adduser user chrome-remote-desktop
RUN su - user -c 'DISPLAY= /opt/google/chrome-remote-desktop/start-host --code="4/0AX4XfWi_AiwsMhtDAQvQGuY_7wIVFR-sKR9H3hQVYsonGEJMw8Uuf0GAf2nsQ_8mgUy54A" --redirect-url="https://remotedesktop.google.com/_/oauthredirect" --name=$(hostname) --pin=123456' && service chrome-remote-desktop start ; service chrome-remote-desktop start &

COPY . .

CMD bash
