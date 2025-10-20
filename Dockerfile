# Use an official lightweight Node image
FROM node:18-alpine

# Set working directory inside container
WORKDIR /usr/src/app

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy the rest of the source code
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the app
CMD ["node", "src/app.js"]

