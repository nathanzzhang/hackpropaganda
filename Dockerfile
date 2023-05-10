# ======= CONFIGURE =======
# Use a Node 18 base image
FROM node:18-alpine

# Set the working directory to /src inside the container
WORKDIR /src

# Copy app files (there is a space between both ".")
COPY . .

# ======= BUILD =======
# Install dependencies (ensuring exact versions in the lockfile get installed)
RUN npm ci

# Build the app
RUN npm run build

# ======= RUN =======
# Set the environment to "production"
ENV NODE_ENV production

# Expose the port that the app will be running on (3000)
EXPOSE 3000

# Start the app
CMD ["npx", "serve", "build"]

