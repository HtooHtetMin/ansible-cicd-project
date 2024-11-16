FROM node:20-alpine

#if ubuntu used, need to install this 
#FROM ubuntu:24.04
#RUN apt-get update && apt-get install -y curl && apt-get install -y nodejs && apt-get install -y npm

LABEL maintainer="HtooHtetMIN <htoohtet102833@gmail.com>"
LABEL version="1.0"
LABEL description="This is a Docker file for Node.js application."

#Set the working directory
WORKDIR /app

#Copy package.json and package-lock.json
COPY package*.json ./

#install app dependencies
RUN npm install 

#Copy app source code
COPY . .

#Build the app 
RUN npm run build

#Expose the port
EXPOSE 3000

#Start the app
CMD [ "npm", "start" ]

#Instruction to build the image
#docker build -t nextjs-app .
#docker run -p 3000:3000 -d --restart=always --name nextjs-app nextjs-app



