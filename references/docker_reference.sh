# --------------------------------------------------------------------------------
# Docker Reference and Guide
#
# ReferenceCollection.com
# Licensed under the MIT License
# --------------------------------------------------------------------------------

# TABLE OF CONTENTS
# -----------------
# 1.  Introduction to Docker
# 2.  Core Concepts and Architecture
# 3.  Installation and Setup
# 4.  Docker Images and Containers
# 5.  Docker Networking
# 6.  Docker Volumes
# 7.  Docker Compose
# 8.  Docker Swarm
# 9.  Docker Security
# 10. Container Registry
# 11. Monitoring and Logging
# 12. Troubleshooting and Maintenance

# --------------------------------------------------------------------------------
# 1. Introduction to Docker
# --------------------------------------------------------------------------------

# Docker is an open-source platform that automates the deployment, scaling, and 
# management of applications using containerization. It allows developers to package 
# applications and their dependencies into a standardized unit called a container.

# Key Features:
# - Lightweight: Containers share the host OS kernel, making them more efficient than VMs
# - Portable: Containers can run on any system that supports Docker
# - Scalable: Easily scale applications across multiple environments
# - Secure: Isolates applications from each other and the host system
# - Version Control: Track container image versions
# - DevOps Integration: Supports CI/CD pipelines

# Use Cases:
# - Microservices architecture
# - Development and testing environments
# - Continuous Integration/Deployment (CI/CD)
# - Application isolation and security

# --------------------------------------------------------------------------------
# 2. Core Concepts and Architecture
# --------------------------------------------------------------------------------

# Architecture Components:
# - Docker Engine: Core container runtime
# - Docker Daemon: Background service managing containers
# - Docker Client: CLI tool for Docker interaction
# - Docker Registry: Storage for Docker images
# - Docker Objects: Images, containers, networks, volumes

# Key Concepts:
# - Images: Read-only templates for creating containers
# - Containers: Runnable instances of images
# - Dockerfile: Instructions for building images
# - Registry: Repository for storing and sharing images
# - Volume: Persistent data storage
# - Network: Communication between containers

# --------------------------------------------------------------------------------
# 3. Installation and Setup
# --------------------------------------------------------------------------------

# Linux (Ubuntu/Debian):
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# MacOS Or Windows:
# Download and install Docker Desktop from https://www.docker.com/products/docker-desktop

# Post-installation steps:
sudo usermod -aG docker $USER  # Add user to docker group
newgrp docker                  # Apply group changes

# Verify installation:
docker --version
docker info

# Configure Docker daemon:
cat > /etc/docker/daemon.json << EOF
{
    "log-driver": "json-file",
    "log-opts": {
        "max-size": "10m",
        "max-file": "3"
    }
}
EOF

# Start and enable Docker service:
sudo systemctl start docker
sudo systemctl enable docker

# --------------------------------------------------------------------------------
# 4. Docker Images and Containers
# --------------------------------------------------------------------------------
# Docker Images:
# - A Docker image is a lightweight, standalone, and executable software package 
#   that includes everything needed to run a piece of software.

# Image Commands:
docker pull <image>          # Download an image from Docker Hub
docker build -t <name> .     # Build an image from a Dockerfile
docker images                # List all images
docker tag <image> <new>     # Tag an image
docker push <image>          # Push image to registry
docker rmi <image>           # Remove an image

# Docker Containers:
# - A container is a runtime instance of a Docker image, isolated from other containers
#   and the host system.

# Container Commands:
docker run <image>           # Run a container from an image
docker ps                    # List running containers
docker ps -a                 # List all containers
docker stop <container>      # Stop a running container
docker start <container>     # Start a stopped container
docker restart <container>   # Restart a container
docker rm <container>        # Remove a container
docker exec -it <container> <command>  # Execute command in container

# Resource Constraints:
docker run --memory=512m <image>    # Memory limit
docker run --cpus=2 <image>         # CPU limit
docker run --pids-limit=100 <image> # Process limit

# --------------------------------------------------------------------------------
# 5. Docker Networking
# --------------------------------------------------------------------------------
# Docker provides several networking options to connect containers to each other 
# and to the outside world.

# Network Types:
# - Bridge: Default network type, allows containers to communicate on the same host
# - Host: Shares the host's networking namespace
# - None: Disables networking for a container
# - Overlay: Enables communication between containers on different Docker hosts
# - Macvlan: Assign MAC address to container

# Network Commands:
docker network ls                    # List all networks
docker network create <name>         # Create a new network
docker network connect <net> <container>    # Connect container to network
docker network disconnect <net> <container> # Disconnect container from network
docker network inspect <name>        # View network details
docker network rm <name>             # Remove a network

# Network Configuration:
docker run --network=host <image>     # Use host network
docker run --dns=8.8.8.8 <image>      # Custom DNS
docker run --add-host=host:ip <image> # Add hosts entry

# --------------------------------------------------------------------------------
# 6. Docker Volumes
# --------------------------------------------------------------------------------
# Docker volumes are used to persist data generated by and used by Docker containers.

# Volume Types:
# - Named Volumes: Managed by Docker
# - Bind Mounts: Mount host directory
# - tmpfs: Temporary filesystem in memory

# Volume Commands:
docker volume create <name>  # Create a new volume
docker volume ls             # List all volumes
docker volume inspect <name> # Display volume information
docker volume rm <name>      # Remove a volume
docker volume prune          # Remove unused volumes

# Volume Usage:
docker run -v <vol>:/path <image>      # Use named volume
docker run -v /host:/container <image> # Bind mount
docker run --tmpfs /path <image>       # Use tmpfs mount

# --------------------------------------------------------------------------------
# 7. Docker Compose
# --------------------------------------------------------------------------------
# Docker Compose is a tool for defining and running multi-container applications.

# Example docker-compose.yml:
version: '3.8'
services:
  web:
    image: nginx
    ports:
      - "80:80"
    volumes:
      - ./html:/usr/share/nginx/html
  db:
    image: postgres
    environment:
      POSTGRES_PASSWORD: secret

# Common Commands:
docker-compose up -d         # Start services in detached mode
docker-compose down          # Stop and remove services
docker-compose ps            # List services
docker-compose logs          # View service logs
docker-compose exec web bash # Execute command in service

# --------------------------------------------------------------------------------
# 8. Docker Swarm
# --------------------------------------------------------------------------------
# Docker Swarm is a native clustering and orchestration tool for Docker containers.

# Key Concepts:
# - Node: An instance of Docker Engine in the swarm
# - Service: A task that can be scaled across nodes
# - Stack: Collection of services that make up an application

# Swarm Commands:
docker swarm init           # Initialize a swarm
docker swarm join           # Join a swarm
docker node ls              # List nodes
docker service create       # Create a service
docker service ls           # List services
docker service scale web=3  # Scale service
docker stack deploy -c docker-compose.yml <stack> # Deploy stack

# --------------------------------------------------------------------------------
# 10. Docker Security
# --------------------------------------------------------------------------------

# Best Practices:
# - Use official images from Docker Hub
# - Keep Docker and images up to date
# - Scan images for vulnerabilities
# - Run containers as non-root users
# - Use read-only filesystems when possible
# - Implement resource limits
# - Enable content trust

# Security Commands:
docker scan <image>             # Scan image for vulnerabilities
docker trust sign <image>       # Sign image
docker run --read-only <image>  # Read-only filesystem
docker run --security-opt=no-new-privileges <image>  # Restrict privileges

# --------------------------------------------------------------------------------
# 9. Container Registry
# --------------------------------------------------------------------------------

# Registry Operations:
docker login              # Log in to a registry
docker logout             # Log out from a registry
docker pull <image>       # Pull image from registry
docker push <image>       # Push image to registry

# Private Registry:
docker run -d \
  -p 5000:5000 \
  --restart=always \
  --name registry \
  registry:2

# --------------------------------------------------------------------------------
# 11. Monitoring and Logging
# --------------------------------------------------------------------------------

# Monitoring Commands:
docker stats              # View container resource usage
docker events             # View real-time events
docker top <container>    # View container processes

# Logging:
docker logs <container>    # View container logs
docker logs -f <container> # Follow log output
docker logs --tail 100 <container> # View last 100 lines

# --------------------------------------------------------------------------------
# 12. Troubleshooting and Maintenance
# --------------------------------------------------------------------------------

# Debugging Commands:
docker logs <container>    # View container logs
docker exec -it <container> /bin/sh  # Access container shell
docker inspect <container> # View detailed information
docker events              # Monitor Docker events

# Cleanup Commands:
docker system prune      # Remove unused data
docker container prune   # Remove stopped containers
docker image prune       # Remove unused images
docker volume prune      # Remove unused volumes
docker network prune     # Remove unused networks

# System Information:
docker info              # View system-wide information
docker version           # View Docker version
docker system df         # View Docker disk usage

# Happy Containerizing!