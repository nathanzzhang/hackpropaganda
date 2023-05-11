# ======= CONFIGURE =======
# Use a Node 18 base image
FROM node:18-alpine

# Set the working directory to /app inside the container
WORKDIR /app

# Copy app files (there is a space between both ".")
COPY . .

# ======= BUILD =======
# Install dependencies (ensuring exact versions in the lockfile get installed)
RUN npm ci

# ======= RUN =======
# Start the app
CMD ["npm", "start"]



