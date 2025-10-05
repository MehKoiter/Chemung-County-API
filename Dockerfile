# Use the official Node.js 18 runtime as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Create a non-root user to run the application
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001

# Copy the rest of the application code
COPY --chown=nodejs:nodejs . .

# Create necessary directories
RUN mkdir -p logs uploads && \
    chown -R nodejs:nodejs logs uploads

# Switch to the non-root user
USER nodejs

# Expose the port the app runs on
EXPOSE 3000

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD node healthcheck.js

# Define the command to run the application
CMD ["npm", "start"]