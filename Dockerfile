# start building it based on the Node image
# install node

# alpine is much, much more smaller than usual Linux Distro
FROM node:24-alpine

# Like you cd-ed into that directory 
# Every following command will start from this app directory
WORKDIR /app

# Install our dependencies first, so that they can be cached
COPY package*.json ./

RUN npm install

# Copy the rest of the local directory
# notice that things like .env, dist/,and node_modules/ 
# should be included in the .dockerignore file
COPY . . 

ENV PORT=3030

EXPOSE 3030

# Can only have one CMD statement 
# The "entry point" command
CMD [ "npm", "start"]