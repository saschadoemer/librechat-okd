# Use the official LibreChat image as base
FROM ghcr.io/danny-avila/librechat:latest

# Switch to root to change ownership
USER root

# Ensure app directory is owned by node user
RUN chown -R node:node /app

# Switch to non-root user
USER node

# Run the application
CMD ["npm", "run", "backend"]