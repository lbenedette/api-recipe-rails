FROM node:9.11.1-alpine

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package.json ./
COPY package-lock.json ./

# install project dependencies
RUN npm install
 
# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .