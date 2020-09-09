FROM node:12.18.3
LABEL Rubens Armôa Lopes
WORKDIR /var/www
USER node
EXPOSE 8080
ENTRYPOINT yarn --ignore-optional && yarn serve
