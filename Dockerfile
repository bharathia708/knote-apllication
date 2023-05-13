# Use the official Ubuntu 20.04 image as the base
FROM ubuntu:20.04

# Set the working directory in the container
WORKDIR /app

# Update the package lists and install Node.js and npm
RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .

# Expose the port on which the application will run
EXPOSE 8080

# Specify the command to run the application
CMD [ "npm", "start" ]
