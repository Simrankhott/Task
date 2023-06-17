#!/bin/bash

# To Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    # Install Docker 
    # For Ubuntu/Debian:
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    # Install Docker Compose 
    # For Linux:
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose 
fi

# Set the absolute path to the docker-compose.yml file
compose_file="/home/ubuntu/docker-compose.yml"

# Create the site

create_site() {
    site_name=$1

    # Creating a directory for the site
    mkdir -p ~/sites/$site_name
    cd ~/sites/$site_name

    # Start the containers with the specified docker-compose file
    docker-compose -f $compose_file up -d

    # Adding an entry to /etc/hosts
    echo "127.0.0.1 $site_name" | sudo tee -a /etc/hosts

    echo "Site created successfully!"
    echo "Open http://$site_name in your browser to access the site."
}

# Start the site
start_site() {
    site_name=$1

    # Go to the site directory
    cd ~/sites/$site_name

    # Start the containers with the specified docker-compose file
    docker-compose -f $compose_file start

    echo "Site started successfully!"
    echo "Open http://$site_name in your browser to access the site."
}

# Stop the site
stop_site() {
    site_name=$1

    # Go to the site directory
    cd ~/sites/$site_name

    # Stop the containers with the specified docker-compose file
    docker-compose -f $compose_file stop

    echo "Site stopped successfully!"
}

# Delete the site
delete_site() {
    site_name=$1

    # Go to the site directory
    cd ~/sites/$site_name

    # Stop and remove the containers with the specified docker-compose file
    docker-compose -f $compose_file down

    # Remove the site directory
    cd ..
    rm -rf $site_name

    # Remove the entry from /etc/hosts
    sudo sed -i "/$site_name/d" /etc/hosts

    echo "Site deleted successfully!"
}

# Parse command-line arguments
case $1 in
    create)
        create_site $2
        ;;
    start)
        start_site $2
        ;;
    stop)
        stop_site $2
        ;;
    delete)
        delete_site $2
        ;;
    *)
        echo "Usage: ./script.sh [create|start|stop|delete] site_name"
        exit 1
        ;;
esac
