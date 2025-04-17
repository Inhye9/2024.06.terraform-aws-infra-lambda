 # Terraform AWS Infrastructure Setup

This repository contains a Terraform configuration to provision basic AWS infrastructure including:

- VPC (Virtual Private Cloud)
- Public and Private Subnets
- Internet Gateway (IGW)
- NAT Gateway
- IAM Role and Policy
- AWS Lambda Function

The purpose of this project is to demonstrate infrastructure-as-code (IaC) practices using Terraform.



## 🧱 Components

- **VPC**: Custom CIDR block
- **Subnets**: Public and private subnets across availability zones
- **Internet Gateway**: For public subnet internet access
- **NAT Gateway**: For private subnet outbound internet access
- **Route Tables**: Associated with public and private subnets
- **IAM**: Role and policy for Lambda execution
- **Lambda**: Sample AWS Lambda function deployed with IAM role



## 📁 Project Structure

```bash
terraform-aws-infra-lambda/
├── README.md
├── envrionments/ 
│   └── test/
│       ├── main.tf 
│       ├── test.tfvars 
|       └── variables.tf 
├── modules 
│   └── lambda/ 
│      ├── iam.tf
|      ├── lambda.tf 
|      ├── tag.tf 
|      └── variables.tf  
├── vpc 
│   ├── acl.tf
|   ├── igw.tf 
|   ├── nat.tf
|   ├── variables.tf  
|   ├── rtb.tf  
|   ├── sg.tf
|   ├── subnet.tf
|   ├── tag.tf
|   ├── vpc.tf
|   └── variables.tf 
```



## ⚙️ Requirements

- Terraform v1.3+
- AWS CLI configured (`aws configure`)
- An AWS account with access key (You need to make your own access key!)



## 🚀 How to Use

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/terraform-aws-infra.git
cd terraform-aws-infra
```

### 2. Initialize Terraform 
```bash
terraform init 
``` 

### 3. Preview the Infrastructure  
```bash
terraform plan -var-file=test.tfvars 
``` 

### 4. Apply the Configuration 
```bash
terraform apply -var-file=test.tfvars 
``` 

## 📌 Note 
- Default values can be customized via variable.tf      
- All secrets and proprietary information have been removed
- This is a simplified example intended for demo or learning purposes
