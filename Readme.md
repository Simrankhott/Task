# Docker WordPress Management Script

This script provides a easy way to understand what exactly each step is doing in my shell script file.

## Prerequisites

First step its checking if the docker is installed or not.if not then its installing same goes with docker-compose step.for official docker image visit this sites.

- Docker: Follow the official Docker installation instructions for your operating system.
- Docker Compose: Refer to the Docker Compose installation guide for detailed installation instructions.

## One step

1. I tried to provide a absolute path for my docker-compose.yml for easy finding.

2. For creating the new wordpress site as mentioned in the task i created a function create_site()

3. It takes the site name as a command-line argument.

4. It creates a directory for the site, navigates to that directory, and starts the containers defined in the docker-compose.yml file using the provided site name.

5. It adds an entry to the /etc/hosts file to map the site name to localhost (127.0.0.1.)
Finally, it provides a success message and instructs the user to open the site in a browser.

## Two step

1. The start_site() function is defined to start an existing site.
2. It takes the site name as a command-line argument.
3. It navigates to the site directory and starts the containers defined in the docker-compose.yml file using the provided site name.
4. It provides a success message and instructs the user to open the site in a browser.

## Third step

1. The stop_site function() is defined to stop a running site.
2. It stops the containers defined in the docker-compose.yml file using the provided site name.

## Fourth step

1. The delete_site function is defined to delete a site.
2. It stops and removes the containers defined in the docker-compose.yml file and deletes the site directory.
3. It removes the entry for the site from the /etc/hosts file.

## Fifth step

1. The script uses a case statement to parse the command-line arguments.
2. It expects the user to provide a command (create, start, stop, delete) followed by the site name.
3. If an invalid command or insufficient arguments are provided, an error message is displayed.

## To run the script use desired commands

3. Open a terminal and navigate to the directory where the script is located.

4. Run the script with the desired command and site name. Available commands are:

   - `create`: Create a new WordPress site.
   - `start`: Start an existing WordPress site.
   - `stop`: Stop a running WordPress site.
   - `delete`: Delete a WordPress site.

   **Syntax:**

   ```bash
   ./script.sh [command] [site_name]
   ```

   **Examples:**

   - To create a new site with the name "mysite":

     ```bash
     ./script.sh create example.com
     ```

   - To start an existing site named "mysite":

     ```bash
     ./script.sh start example.com
     ```

   - To stop a running site named "mysite":

     ```bash
     ./script.sh stop example.com
     ```

   - To delete a site named "mysite":

     ```bash
     ./script.sh delete example.com
     ```

5. The script will perform the necessary actions based on the command provided.

6. After successful execution, the script will provide instructions to access the WordPress site in a web browser.


Screenshots 

<p align="center">
  <img width="960" alt="Screenshot 2023-06-07 115444" src="https://github.com/Simrankhott/Task/assets/91006102/b8c57a85-3cd6-4ed0-8a3b-a44c79cf9c3b">
</p>
<br> 


<p align="center">
  <img width="960" alt="Screenshot 2023-06-07 115444" src="https://github.com/Simrankhott/Task/assets/91006102/430fd1fa-3c35-4465-80d2-24060b1f2220">
</p>
<br>


<p align="center">
  <img width="960" alt="Screenshot 2023-06-07 115444" src="https://github.com/Simrankhott/Task/assets/91006102/67634d8b-94aa-4803-9a0b-664d5976f971">
</p>
<br>

