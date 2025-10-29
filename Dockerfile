# Stage 1: Base build environment
FROM node:18-alpine AS base
WORKDIR /app
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --legacy-peer-deps
COPY . .
# Install necessary dependencies for sharp (for image optimization)
RUN apk add --no-cache libc6-compat

# Stage 2: Development environment
FROM base AS development
ARG ENVIRONMENT=development
ENV NODE_ENV=$ENVIRONMENT
EXPOSE 3000
CMD ["npm", "run", "dev"]

# Stage 3: Production build
FROM base AS build
ARG ENVIRONMENT=production
ENV NODE_ENV=$ENVIRONMENT
RUN npm run build

# Stage 4: Production runtime environment
FROM node:18-alpine AS production
WORKDIR /app

# Copy standalone output
COPY --from=build /app/.next/standalone ./
COPY --from=build /app/.next/static ./.next/static
COPY --from=build /app/public ./public

# Set environment
ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

# Use the standalone server
CMD ["node", "server.js"]
