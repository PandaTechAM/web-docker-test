FROM node:22.5-alpine3.19 AS production




WORKDIR /app
COPY package*.json ./
RUN npm ci
ARG VITE_BASE_URL \
    VITE_COOKIE_KEY \
    VITE_ADMIN_URL \
    VITE_IMG_URL 

ENV VITE_BASE_URL=$VITE_BASE_URL \
    VITE_COOKIE_KEY=$VITE_COOKIE_KEY \
    VITE_ADMIN_URL=$VITE_ADMIN_URL \
    VITE_IMG_URL=$VITE_IMG_URL
COPY . ./
RUN npm run build
EXPOSE 3000

CMD ["npx", "serve", "-s", "dist"]
