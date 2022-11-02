FROM node:latest

WORKDIR /web
COPY dist /web/

EXPOSE 80

CMD npx http-server . -p 80