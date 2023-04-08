# # Stage 1: Compile and Build angular codebase

# # Use official node image as the base image
# FROM node:latest as build

# # Set the working directory
# WORKDIR /usr/local/docker-angular

# # Add the source code to app
# COPY ./ /usr/local/docker-angular

# # Install all the dependencies
# RUN npm Install

# # Generate the build of the application
# RUN npm run build

# # Stage 2: Serve app with nginx server

# # Use official nginx image as the base image
# FROM nginx:latest

# # Copy the build output to replace the default nginx contents
# COPY --from=build /usr/local/docker-angular/dist/sample-angular-app /usr/share/nginx/html

# # Expose port 80
# EXPOSE 80

# Use an official Node.js runtime as a parent image
FROM node:latest as build
# Set the working directory to /app
WORKDIR /app
# Copy package.json and package-lock.json to the working directory
COPY package*.json ./
# Install dependencies
RUN npm install --force
# Copy the rest of the application to the working directory
COPY . .
# Build the application
RUN npm run build
# Expose port 80
EXPOSE 80
# Start the server
CMD [ "npm", "start" ]


