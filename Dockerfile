# build the react app from node version 18 that is alpine flavour
FROM node:18-alpine AS build
#creating the working Directory in docker container
WORKDIR /app
# copy the package*.json to the  containers root directory
COPY  package.json package-lock.json ./
# installig the required node package 
RUN npm install
# build the react app
COPY . .
RUN npm run build
# copy the remainf files to the root directory
# stage 2 that is from nginx serving app
FROM nginx:alpine uild from the  previous build
COPY  --from=build /app/build /usr/share/nginx/html
# exposing the  port of the container to the out side world
EXPOSE 80
CMD ["nginx","-g","daemon off;"]