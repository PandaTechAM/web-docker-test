FROM node:22.5-alpine3.19 AS production




WORKDIR /app
COPY package*.json ./
RUN npm ci

COPY . ./
RUN npm run build
EXPOSE 3000

CMD ["npx", "serve", "-s", "dist"]
