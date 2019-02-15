FROM node:lts-alpine as builder
WORKDIR '/src/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
COPY --from=builder /src/app/build /usr/share/nginx/html