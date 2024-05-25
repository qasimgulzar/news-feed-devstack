# Project Setup Guide

## Prerequisites
Before you begin, ensure you have the following tools installed on your machine:

- [Solution Walkthrough](https://drive.google.com/file/d/1QScjqhNzMCDlStRB6oRozHBxMB1kBCv4/view?usp=sharing) This video contains detailed walkthrough of the solution.
- [Docker Desktop](https://www.docker.com/products/docker-desktop): Required to orchestrate and run the containers for the project. Installation guides are available for [Windows](https://docs.docker.com/desktop/windows/install/), [Mac](https://docs.docker.com/desktop/mac/install/), and [Linux](https://docs.docker.com/desktop/linux/install/).
- [Docker Compose](https://docs.docker.com/compose/install/): Utilized within Docker Desktop but may require separate installation on Linux.
- [Make](https://www.gnu.org/software/make/): A build automation tool used to manage the project with simple commands. Installation guide is available [here](https://www.gnu.org/software/make/).

## Setup Instructions

### Step 1: Start the Services

Use the Makefile commands to start the services defined in the `docker-compose.yml`:

```bash
make provision  # Run migrations
make runserver  # Starts the backend server
make runapp     # Starts the frontend application
```

# Additional Commands
**Stop Services:**
To stop all running services, use the following command:

```bash
docker-compose down
```
View Logs:
To view logs for a specific service, use:

```bash
docker-compose logs [service-name]
```
Replace [service-name] with app, backend-server, or db, depending on which logs you want to see.

#### Accessing the Applications
**Frontend Application:** Access the frontend by navigating to http://localhost:3000 in your web browser.
**Backend API:** Access the backend API at http://localhost:8000.
#### Troubleshooting
If you encounter issues such as services not starting properly or network problems, check the Docker Compose logs for error messages that may provide insights into what went wrong. Common issues are often related to port conflicts or missing environment configurations.

#### Conclusion
This setup guide should assist in getting the project operational on your local environment using Docker and the Makefile commands. For any further questions or specific issues, refer to the project documentation or contact the development team.