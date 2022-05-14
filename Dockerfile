FROM alpine:edge

RUN apk update && apk add --no-cache bash procps wget ffmpeg

CMD bash
