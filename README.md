# Task-8: Deploy Strapi on AWS ECS Fargate using Terraform & GitHub Actions

## Project Overview
This project demonstrates deploying a **Strapi headless CMS** on **AWS ECS Fargate** using **Terraform (Infrastructure as Code)** and **GitHub Actions for CI/CD**.  
The application image is built and pushed to **Amazon ECR**, and the runtime environment is monitored using **Amazon CloudWatch**.

---

## Objectives of Task-8
- Containerize a Strapi application using Docker
- Automate Docker image build and push to **Amazon ECR**
- Provision AWS infrastructure using **Terraform (modular approach)**
- Deploy Strapi on **ECS Fargate**
- Configure **RDS PostgreSQL** as the backend database
- Enable **CloudWatch logging and ECS metrics**
- Troubleshoot and resolve real-world deployment issues

---

## Architecture Overview
```text
GitHub Push
   ↓
GitHub Actions (CI)
   ↓
Docker Image Build
   ↓
Amazon ECR
   ↓
Terraform Apply
   ↓
AWS ECS Fargate
   ↓
Strapi Application
   ↓
Amazon RDS (PostgreSQL)
   ↓
CloudWatch Logs & Metrics
```


---

## Technologies Used
- **Strapi** (Node.js Headless CMS)
- **Docker**
- **Terraform** (Modular IaC)
- **GitHub Actions** (CI/CD)
- **Amazon ECS (Fargate)**
- **Amazon ECR**
- **Amazon RDS (PostgreSQL)**
- **Amazon CloudWatch**
- **AWS VPC & Security Groups**

---

## Repository Structure
```text
.
├── strapi/ # Strapi application source
│ ├── Dockerfile
│ ├── package.json
│ └── config/
│
├── terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── backend.tf
│ ├── providers.tf
│ └── modules/
│ ├── ecs/
│ ├── rds/
│ ├── ecr/
│ └── cloudwatch/
│
├── screenshots/
│
└── .github/
└── workflows/
└── ci.yml
```

---

## CI/CD Workflow (GitHub Actions)

### CI Pipeline
- Triggers on push
- Builds Docker image for Strapi
- Authenticates with AWS
- Pushes image to **Amazon ECR** with commit SHA tag

### CD (Terraform)
- Infrastructure provisioned using Terraform
- ECS service pulls the latest image from ECR
- Task redeploys automatically

---

## Infrastructure Provisioned via Terraform
- ECS Cluster & Service (Fargate)
- ECS Task Definition
- Amazon ECR Repository
- Amazon RDS PostgreSQL Instance
- CloudWatch Log Group
- Networking via default VPC (auto-discovered subnets)

Terraform was implemented using a **modular structure** for maintainability and clarity.

---

## Monitoring & Observability
- **CloudWatch Logs** configured using `awslogs` driver
- ECS Metrics monitored:
  - CPU Utilization
  - Memory Utilization
  - Task Count
  - Network In / Network Out

---

## Runtime Issues & Real-World Fixes
During deployment, several real-world issues were encountered and resolved:

- Image tag mismatch (`latest` vs commit SHA)
- Missing Strapi production secrets
- PostgreSQL SSL enforcement by AWS RDS
- TLS certificate validation failures
- ECS networking and security group restrictions

All issues were fixed by properly configuring:
- ECS task environment variables
- PostgreSQL SSL settings
- Node.js TLS behavior
- Security group inbound rules

---

## Final Result
- Strapi application successfully running on ECS Fargate
- Admin panel accessible via ECS task public IP
- Logs and metrics visible in CloudWatch
- CI/CD pipeline functioning end-to-end

---

## Author
**Jaspal Gundla**
