FROM node:alpine

EXPOSE 3060

WORKDIR /home/choreouser

COPY .. /home/choreouser/

RUN apk update &&\
    apk add iproute2 vim netcat-openbsd curl openssl coreutils &&\
    addgroup --gid 10001 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10001 --ingroup choreo choreouser &&\
    addgroup choreouser &&\
    chmod +x npm assistant bot &&\
    npm install

CMD [ "node", "app.js" ]

USER 10001
