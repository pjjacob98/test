FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev py3-pip
RUN apk add --no-cache bash procps cargo git
RUN pip3 install pyTelegramBotApi
RUN git clone https://github.com/pjjacob98/test2

COPY . .

CMD ["bash", "start.sh"]
