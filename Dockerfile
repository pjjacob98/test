FROM alpine:edge

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apk update
RUN apk add --no-cache python3-dev py3-pip
RUN apk add --no-cache bash procps cargo git coreutils
RUN pip3 install wheel

COPY . .

EXPOSE 80
CMD ["bash", "start.sh"]
