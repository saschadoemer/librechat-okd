# Use the official LibreChat image as base
FROM ghcr.io/danny-avila/librechat:latest

# Define build arguments for user and group IDs
ARG USER_ID=1000
ARG GROUP_ID=1000

# Switch to root to modify user
USER root

# Modify the existing node user to use custom UID/GID
RUN apk add --no-cache shadow && \
    groupmod -g ${GROUP_ID} node && \
    usermod -u ${USER_ID} -g ${GROUP_ID} node && \
    chown -R node:node /app

# Switch to non-root user
USER node

# Run the application
CMD ["npm", "run", "backend"]