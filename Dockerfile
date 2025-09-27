# Use a base Node.js image
FROM node:lts-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build your Webpack assets (if needed for production)
RUN npm run build

# Expose the port your Webpack dev server or built application will run on
EXPOSE 8080

# Define the command to run your application (e.g., Webpack dev server)
# Launching a server for development or production
# CMD ["npx", "live-server", "--host=0.0.0.0", "--port=8080", "--open=."]
CMD ["npm", "run", "start"]
