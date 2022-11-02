FROM node:latest AS builder

WORKDIR /app
COPY package-lock.json package.json /app/

RUN npm install
COPY . .
RUN npm run build

FROM node:latest

WORKDIR /web
COPY --from=builder /app/dist /web/

EXPOSE 80

CMD npx http-server . -p 80