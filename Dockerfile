FROM node:lts-alpine as builder
WORKDIR '/home/kituyib/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /home/kituyib/src/app/build /usr/share/nginx/html