# Use the Node.js 22.5-alpine image as the base for a production environment
FROM node:22.5-alpine3.19 AS production

# Set the working directory to /app
WORKDIR /app

# Copy both package.json and yarn.lock (instead of package-lock.json)
COPY package.json yarn.lock ./

# Install dependencies with Yarn
RUN yarn install --frozen-lockfile

# Define build-time arguments for Vite environment variables

# Copy the rest of the application code to the working directory
COPY . ./

# Run the build script
RUN yarn build

# Expose port 3000 for the application
EXPOSE 3000

# Start the server with npx serve, serving the built files from the dist folder
CMD ["npx", "serve", "-s", "dist"]
