FROM node:20-slim

ENV NODE_ENV=production

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

COPY . .
RUN node --check server.js && node --check src/server.js

EXPOSE 5000

CMD ["node", "server.js"]
