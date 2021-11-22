FROM ruby:3.0.2-alpine3.14

RUN apk update && \
    apk add --no-cache bash git vim curl less build-base

RUN mkdir -p /apps/study
ADD . /apps/study
WORKDIR /apps/study

CMD bash
