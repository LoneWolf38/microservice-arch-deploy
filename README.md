# On-Premise Deployments

Solution of the problems faced from On-premise deployments of containerized microservices. I have taken a single containerized web application as a single microservice, I have to prepare the CI/CD pipeline of this microservice deployed to a cluster of VMs or client-managed hardware servers. This project provides automatic deployments of containers, automatic building, testing and updating of the microservice, monitoring of the containers, disaster management and security of the application.

Github: https://github.com/LoneWolf38/microservice-arch-deploy

## Usage Instructions:

We can use Terraform as Infrastructure management to create the clusters.
Servers will be provisioned with nomad and consul with server and client config.
Consul and Nomad master nodes, stateful instances with elastic IPs.
Consul and Nomad Worker nodes in a AutoScaling Group.
Docker Registry for store and serve images produced by Jenkins build jobs.
Nomad For Cluster management and microservice orchestration.
LoadBalancing, Networking, reverse Proxy done with Fabio
Consul Servers for Service Discovery, Monitoring, 
Vault for Secrets and security. You need to add a Vault Server in the network.
Data Metrics and data visualisation with Promethues from metrics provided by Nomad.
Source Code will have the Dockerfile and .travis.yml file for travis ci servers
Travis CI will have trigger builds and scripts to upload the docker images after successful builds


## Use Case/Edge Conditions:

Use Case: Terraform is used for infrastructure creation and management by as a Code principle. This tool automates the process of creating/spinning up virtual machines in cloud or any hardware servers. 

Edge Condition: 

Use Case: Consul, Nomad and Vault will provide the service discovery of clusters, containers orchestration and secrets management. This 3 tools will solve the problem of ease of clustered enterprise level deployments, health monitoring and alerts, data metrics visualisation, application security and disaster management.

Edge Condition: 

Use Case: Travis CI is integrated with Github for easy triggered updates, each successful build will be packaged into docker images 

Workflow:
1. With Every push to the repository in Github,travis CI build will be triggered and the docker image produced by the build will be pushed to the docker registry to be pulled from the QA cluster. 

2. Updated images will be pulled in the QA cluster for testing. After the testing, passed images will be pushed to docker registry, which will then be pulled in the Production Cluster for deployment.
 
3. Nomad will deploy containers in the respective clusters and schedule jobs and tasks for deployment and updates.
Nomad also provides monitoring and health check for containers, resource allocation, load balancing etc.

4. Consul will register each nodes in the cluster and also maintains each clusters with different configuration. It helps Nomad in service discovery, health checks on the worker servers and master servers, monitoring of resource usage, incoming and outgoing traffic and also alerts if a server fails or multiple servers fails. LoadBalancing will be easily handled by fabio.

5. Vault sits on a server. Vault provides secure, store and tightly control access to tokens, passwords, certificates, encryption keys for protecting secrets and other sensitive data using a UI, CLI, or HTTP API. Vault keeps application data secure with centralized key management and simple APIs for data encryption. Vault also have integration with multi-cloud identity services.

6. Lastly Terraform is used to manage or expand existing infrastructure automatically through simple codes. Terraform, Nomad, Vault uses HCL i.e. HashiCorp Configuration Language which is easy to understand and write. All of the technologies uses single binaries with dual modes(server or client) or single mode.

7. Docker Registry will store the docker images of the microservices. This will help in automatic deployment of the docker containers.


## Data Formats:
Every repo will have a .travis.yml file for travis servers to build and integrate according to the file.
Every repo will have a Dockerfile for how to create a docker image of the microservice.
Every image will have a build number which indicates the version number of the image.

Nomad, Consul, Vault Configuration will be stored in the servers and worker nodes in the cluster.
Data metrics will be collected from Nomad API and will be input to Prometheus for data visualization.
Consul, Vault and Nomad each have their own web UI for interactive user experience. 

## Performance and Scaling



## Unresolved issues 