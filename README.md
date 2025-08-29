# AWS VPC Networking Projects

This repository documents my journey through **9 hands-on projects** in AWS networking, focused on building, securing, and automating a Virtual Private Cloud (VPC). The projects combine **Terraform Infrastructure as Code (IaC)** with **GitHub Actions CI/CD pipelines** to ensure scalable, consistent, and automated deployments.

---

## 📑 Table of Contents

- [Project Description](#project-description)
- [Project Flow: From Code to CI/CD](#project-flow-from-code-to-cicd)
- [Why Terraform & CI/CD](#why-terraform--cicd)
- [Challenges Encountered](#challenges-encountered)
- [Projects Overview (1–9)](#projects-overview-1–9)
- [Setup Instructions](#setup-instructions)
- [Next Steps](#next-steps)

---

## 📘 Project Description

The goal of this series is to build a **robust AWS VPC networking foundation** using Terraform, while enforcing **best practices** such as modular design, automation, and continuous integration. Each project builds upon the previous one, gradually expanding the network architecture.

---

## 🔄 Project Flow: From Code to CI/CD

1. **Code** – Each resource (VPC, Subnet, Route Table, Security Group, etc.) is written as a **reusable Terraform module**.
2. **Commit** – Changes are pushed to GitHub.
3. **CI (Continuous Integration)** – Runs `terraform fmt`, `init`, `validate`, and `plan` to ensure code quality.
4. **CD (Continuous Deployment)** – On successful CI, GitHub Actions automatically applies the Terraform code to AWS.
5. **Auto-Destroy (Cost Optimization)** – After 10 minutes, a scheduled job runs `terraform destroy` to avoid unnecessary costs.

This ensures a smooth **code → test → deploy → clean up** cycle.

---

## ⚙️ Why Terraform & CI/CD

- **Terraform**:

  - Declarative Infrastructure as Code
  - Modular and reusable design
  - Easy to replicate environments (Dev, Staging, Prod)

- **CI/CD**:
  - Eliminates manual steps in provisioning
  - Ensures consistency across deployments
  - Reduces errors and enforces automation-first practices
  - Auto-destroy prevents unwanted AWS bills 💸

---

## ⚠️ Challenges Encountered

- Handling **Terraform module dependencies** (ensuring VPC, subnets, and gateways link correctly)
- Fixing **type errors** in security group definitions
- Optimizing the **GitHub Actions workflow** to avoid job failures
- Balancing **automation with cost control** (destroy after 10 minutes)

Each challenge helped reinforce best practices in debugging, modular design, and automation.

---

## 🗂️ Projects Overview (1–9)

1️⃣ **Build a Virtual Private Cloud** – Create the foundation of your network.  
2️⃣ **VPC Traffic Flow and Security** – Control inbound/outbound traffic with route tables and security groups.  
3️⃣ **Creating a Private Subnet** – Isolate workloads for tighter security.  
4️⃣ **Launching VPC Resources** – Deploy EC2 instances and other resources inside the VPC.  
5️⃣ **Testing VPC Connectivity** – Validate network communication between public and private resources.  
6️⃣ **VPC Peering** – Connect multiple VPCs for cross-network communication.  
7️⃣ **VPC Monitoring with Flow Logs** – Capture and analyze network traffic for visibility.  
8️⃣ **Access S3 from a VPC** – Securely connect your VPC to Amazon S3.  
9️⃣ **VPC Endpoints** – Optimize connectivity to AWS services privately without using the internet.

---

## 🛠️ Setup Instructions

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/aws-vpc-projects.git
   cd aws-vpc-projects/envs/dev
   ```

2. Configure AWS credentials (via IAM Role or AWS CLI).

3. Initialize Terraform:

   ```bash
   terraform init
   ```

4. Apply the infrastructure:

   ```bash
   terraform apply -auto-approve
   ```

5. (Optional) Destroy after testing:
   ```bash
   terraform destroy -auto-approve
   ```

CI/CD will automate steps 3–5 if GitHub Actions is configured with the proper secrets.

---

## 🚀 Next Steps

- Expand Terraform modules for advanced services (ECS, RDS, Load Balancers).
- Add **unit tests for Terraform** with `terratest`.
- Enhance cost-optimization strategies for long-running environments.
