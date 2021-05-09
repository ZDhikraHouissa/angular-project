# Stage 1

FROM node:10-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build 

# Stage 2

FROM nginx:alpine

RUN rm /etc/nginx/conf.d/default.conf #remove default nginx configuration


COPY --from=build-step /app/dist /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d# replace it with the file 
 


 