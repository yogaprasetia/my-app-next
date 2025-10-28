This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

## Deploy with Docker & Portainer

This project includes Docker configuration for easy deployment with Portainer.

### Prerequisites

- Docker and Docker Compose installed
- Portainer instance running
- Access to push Docker images to a registry (optional)

### Local Development with Docker

To build and run the application locally using Docker:

```bash
# Build and start the containers
docker-compose up --build

# Or run in detached mode
docker-compose up -d --build
```

The application will be available at [http://localhost:3000](http://localhost:3000).

### Deploying to Portainer

1. **Build the Docker image** (if not using a registry):
   ```bash
   docker build -t my-app-next:latest .
   ```

2. **Push to registry** (optional, recommended for production):
   ```bash
   # Tag the image for your registry
   docker tag my-app-next:latest your-registry/my-app-next:latest
   
   # Push to registry
   docker push your-registry/my-app-next:latest
   ```

3. **Deploy in Portainer**:
   - Open your Portainer instance
   - Go to "Stacks" in the left menu
   - Click "Add stack"
   - Choose "Web editor" or "Upload" the docker-compose.yml file
   - Modify the image name in docker-compose.yml if using a registry:
     ```yaml
     services:
       app:
         image: your-registry/my-app-next:latest  # Change this line
     ```
   - Click "Deploy the stack"

4. **Access your application**:
   - Once deployed, your application will be available on the configured port (default: 3000)
   - You can configure port mapping or reverse proxy in Portainer if needed

### Environment Variables

For production deployment, you may want to add environment variables to your docker-compose.yml:

```yaml
services:
  app:
    environment:
      - NODE_ENV=production
      - NEXT_PUBLIC_API_URL=https://your-api.com
      - SECRET_KEY=your-secret-key
```

### Monitoring and Logs

- View logs in Portainer under the container details
- The application includes a health check that monitors availability
- Container will automatically restart unless stopped manually

### Troubleshooting

- If the container fails to start, check the logs in Portainer
- Ensure all required environment variables are set
- Verify that port 3000 is not already in use on the host
- For build issues, check that the Dockerfile has the correct permissions
