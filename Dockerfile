FROM alpine:edge

RUN apk update && apk add --no-cache bash procps wget x265-dev x265

CMD bash
