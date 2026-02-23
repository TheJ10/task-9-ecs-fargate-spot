# Task-9: Strapi Deployment on AWS ECS using Fargate Spot (Terraform + CI/CD)

## Project Overview
This project demonstrates deploying a Strapi application on AWS ECS using Fargate Spot, fully managed through Terraform and automated with GitHub Actions.

This is an upgrade from the previous deployment where standard Fargate was used. In this version, the ECS service is configured with a capacity provider strategy using FARGATE_SPOT to optimize compute cost while maintaining a serverless architecture.

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
   GitHub Actions (CD)
         ↓
   Terraform Apply
         ↓
ECS Cluster (Fargate Spot)
         ↓
Strapi Application Running
```

---

## Technologies Used
- **Strapi** (Node.js Headless CMS)
- **Docker**
- **Terraform** (Modular IaC)
- **GitHub Actions** (CI/CD)
- **Amazon ECS**
- **Amazon ECR**
- **Amazon RDS (PostgreSQL)**
- **AWS VPC & Security Groups**
- **AWS Fargate Spot**

---

## Infrastructure Provisioned via Terraform
- ECS Cluster
- ECS Task Definition
- ECS Service (Fargate Spot Capacity Provider)
- Amazon ECR Repository
- Amazon RDS PostgreSQL Instance
- DB Subnet Group
- Networking (Default VPC & Subnets)
Infrastructure is organized using a modular Terraform structure for better maintainability.

---

## CI/CD Workflow
### CI Pipeline
- Builds Docker image
- Pushes image to Amazon ECR
- Generates image tag

### CD Pipeline
- Runs Terraform
- Updates ECS Task Definition with new image tag
- Deploys updated service automatically

---

## Key Upgrade in Task-9
- Replaced standard Fargate with Fargate Spot
- Configured ECS Service using capacity provider strategy
- Achieved cost optimization without changing application architecture
- Maintained fully automated CI/CD pipeline

---

## Application Access
The Strapi admin panel runs on ECS Fargate Spot and is accessible via the public IP assigned to the task.

### Example:
```bash
http://<public-ip>:1337/admin
```

---

## Repository Structure
```text
.
├── strapi/
│   ├── Dockerfile
│   ├── package.json
│   └── config/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── backend.tf
│   └── modules/
│       ├── ecs/
│       ├── rds/
│       └── ecr/
│
└── .github/
    └── workflows/
        ├── ci.yml
        └── deploy.yml
```

---

## Final Result
- Strapi application successfully running on ECS Fargate spot
- Admin panel accessible via ECS task public IP
- Logs and metrics visible in CloudWatch
- CI/CD pipeline functioning end-to-end

---

## Loom Video
Link: https://www.loom.com/share/db64b5cac7344da0a90ca1f6ed1dd9b2

---

## Author
**Jaspal Gundla**
