# On-Premise Deployments

Solution of the problems faced from On-premise deployments of containerized micro services. I have taken a single containerized web application as a single micro service, I have to prepare the CI/CD pipeline of this micro service deployed to a cluster of VMs or client-managed hardware servers. This project provides automatic deployments of containers, automatic building, testing and updating of the micro service, monitoring of the containers, disaster management and security of the application.

Github: https://github.com/LoneWolf38/microservice-arch-deploy

## Usage Instructions:

- We can use Terraform as Infrastructure management to create the clusters.
- Servers will be provisioned with nomad and consul with server and client config.
- Consul and Nomad master nodes, stateful instances with elastic IPs.
- Consul and Nomad Worker nodes in a AutoScaling Group.
- Docker Registry for store and serve images produced by Jenkins build jobs.
- Nomad For Cluster management and microservice orchestration.
- LoadBalancing, Networking, reverse Proxy done with Fabio
- Consul Servers for Service Discovery, Monitoring, 
- Vault for Secrets and security. You need to add a Vault Server in the network.
- Data Metrics and data visualization with Prometheus from metrics provided by Nomad.
- Source Code will have the Dockerfile and .travis.yml file for Travis CI servers
- Travis CI will have trigger builds and scripts to upload the docker images after successful builds


## Use Case/Edge Conditions:

Use Case: Terraform is used for infrastructure creation and management by as a Code principle. This tool automates the process of creating/spinning up virtual machines in cloud or any hardware servers. 

Edge Condition: Limited Number of API request set by cloud provider. 

Use Case: Consul, Nomad and Vault will provide the service discovery of clusters, containers orchestration and secrets management. This 3 tools will solve the problem of ease of clustered enterprise level deployments, health monitoring and alerts, data metrics visualization, application security and disaster management.

Edge Condition: No jobs/tasks can be executed from Nomad web UI, only from cli tool. 

Use Case: Travis CI is integrated with Github for easy triggered updates, each successful build will be packaged into docker images 

Edge Condition: Travis CI is providing with its own server for integration and testing. The servers will be located in different network than the cluster and have limited access to them.


## Work flow:
- With Every push to the repository in Github,travis CI build will be triggered and the docker image produced by the build will be pushed to the docker registry to be pulled from the QA cluster. 

- Updated images will be pulled in the QA cluster for testing. After the testing, passed images will be pushed to docker registry, which will then be pulled in the Production Cluster for deployment.
 
- Nomad will deploy containers in the respective clusters and schedule jobs and tasks for deployment and updates.
Nomad also provides monitoring and health check for containers, resource allocation, load balancing etc.

- Consul will register each nodes in the cluster and also maintains each clusters with different configuration. It helps Nomad in service discovery, health checks on the worker servers and master servers, monitoring of resource usage, incoming and outgoing traffic and also alerts if a server fails or multiple servers fails. LoadBalancing will be easily handled by Fabio.

- Vault sits on a server. Vault provides secure, store and tightly control access to tokens, passwords, certificates, encryption keys for protecting secrets and other sensitive data using a UI, CLI, or HTTP API. Vault keeps application data secure with centralized key management and simple APIs for data encryption. Vault also have integration with multi-cloud identity services.

- Lastly Terraform is used to manage or expand existing infrastructure automatically through simple codes. Terraform, Nomad, Vault uses HCL i.e. HashiCorp Configuration Language which is easy to understand and write. All of the technologies uses single binaries with dual modes(server or client) or single mode.

- Docker Registry will store the docker images of the microservice. This will help in automatic deployment of the docker containers.


## Data Formats:
Every repo will have a .travis.yml file for travis servers to build and integrate according to the file.
Every repo will have a Dockerfile for how to create a docker image of the microservice.
Every image will have a build number which indicates the version number of the image.

Nomad, Consul, Vault Configuration will be stored in the servers and worker nodes in the cluster.
Data metrics will be collected from Nomad API and will be input to Prometheus for data visualization.
Consul, Vault and Nomad each have their own web UI for interactive user experience. 

## Performance and Scaling

- It is important to identify resource requirements and resource bottlenecks of each microservice. Resource requirements are specific resources which each microservice needs like CPU,RAM,Disk space etc.

- Access to necessary and required hardware resources as the microservice architecture scales. Each microservice should be provided with appropriate resources. High performance services should be provided with high number of cpu, database services should be provided with ram and disk with fastest r/w disks.

- Dependency scaling of microservice. The dependencies of the microservice should also scalable. 

- Traffic Management of each microservice should be handled effectively. Health Checks and monitoring will help in handling traffic and resource bottlenecks.

- Many programming languages are not optimized for the performance and scalability requirements of microservice architecture, or do not have scalable or performance frameworks that allow microservice to process tasks efficiently. Choosing a programming language which is best for concurrent jobs and partitioning. 

- Scalable data storage. 


## Unresolved issues 
