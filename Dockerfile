# ======= CONFIGURE =======
# Use a Node 18 base image
FROM node:18-alpine as builder

# Set the working directory to /app inside the container
WORKDIR /app

# Copy app files (there is a space between both ".")
COPY . .

# ======= BUILD =======
# Install dependencies (ensuring exact versions in the lockfile get installed)
RUN npm ci

# Build the app
RUN npm run build

# ======= RUN =======
# Bundle static assets with nginx
FROM nginx:1.21.0-alpine as production
ENV NODE_ENV production
# Copy built assets from `builder` image
COPY --from=builder /app/build /usr/share/nginx/html
# Add your nginx.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf
# Expose port
EXPOSE 3000
# Start nginx
CMD ["nginx", "-g", "daemon off;"]



