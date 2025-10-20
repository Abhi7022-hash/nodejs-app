# Stage 1: Build dependencies
FROM node:18-alpine AS builder
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy app source code
COPY . .

# Stage 2: Final image
FROM node:18-alpine
WORKDIR /usr/src/app

# Copy from builder
COPY --from=builder /usr/src/app .

# Expose app port
EXPOSE 3000

# Start the app
CMD ["node", "src/app.js"]


