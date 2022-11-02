FROM node:latest AS builder

RUN npm install -g pnpm

WORKDIR /app
COPY pnpm-lock.yaml package.json /app/

RUN pnpm install
COPY . .
RUN pnpm build

FROM node:latest

WORKDIR /web
COPY --from=builder /app/dist /web/

EXPOSE 80

CMD npx http-server . -p 80