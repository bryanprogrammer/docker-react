FROM node:lts-alpine as builder
WORKDIR '/src/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]
EXPOSE 80 443
COPY --from=builder /src/app/build /usr/share/nginx/html