# Use Ubuntu as the base image
FROM ubuntu:latest

# Set environment variables
ENV TZ=UTC
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g @vue/cli

# Set the working directory
WORKDIR /app

# Copy the Vue.js app files into the container
COPY . .

# Install dependencies and build the Vue.js app
RUN npm install && \
    npm run build

# Expose the port your Vue.js app is running on
EXPOSE 80

# Command to start the Vue.js app
CMD ["npm", "run", "serve"]
