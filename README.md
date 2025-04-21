# AWS Cloud Resume Challenge Project


## Project Overview
The application consists of:
- Static web site
- API Gateway
- Lambda Function
- Nosql database
- Terraform scripts for infrastructure management
- CI/CD pipeline using GitHub Actions

## Requirements

### Local Development
- Node.js >= 18
- AWS CLI configured
- Terraform CLI

### AWS Resources
- AWS Account with appropriate permissions
- S3 Bucket for Terraform state

## Setup Instructions

### 1. AWS Configuration
```shell
# Configure AWS CLI credentials
aws configure

# Create ssh key if needed
ssh-keygen
```

### 2. Application Setup
```shell
# Install dependencies
npm init -y
npm install

# Check formatting without changing files
npm run format:check

# Format all files
npm run format
```


```shell
flake8 app/lambda/
```

```shell
python -m pytest app/lambda/tests
```


```
.
├── app/
│   └── website/
│   └── lambda/
├── infra/
|   ├── backend/
|   ├── database/
|   ├── frontend/
|   └── trust/
├── README.md
```


### 3. Infrastructure Deployment
```shell
# Initialize Terraform
terraform -chdir=infra init

# Validate Terraform
terraform -chdir=infra validate

# Plan changes
terraform -chdir=infra plan

# Deploy infrastructure
terraform -chdir=infra apply -auto-approve
```

### 5. Clean Up
```shell
# Destroy infrastructure
terraform -chdir=infra destroy -auto-approve
```


## GitHub Actions Workflow

The deployment process is automated using GitHub Actions with three stages:

1. **Validation**
   - Terraform validation
   - Variable checking
2. **Terraform Execution**
   - AWS credentials setup
   - Infrastructure deployment
3. **PR Notification**
   - Deployment status updates
   - PR comments


### Testing Actions Locally

1. Install Act:
```bash
curl -s https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash
```

2. Setup test environment:
```bash
# Create test directory if not exists
mkdir -p .act

# Create env file with credentials
echo "AWS_ACCESS_KEY_ID=test" > .act/.env
echo "AWS_SECRET_ACCESS_KEY=test" >> .act/.env
echo "AWS_DEFAULT_REGION=us-east-1" >> .act/.env

# Create pull request event simulation
cat > .act/pull_request.json << EOF
{
  "pull_request": {
    "number": 1,
    "body": "Test PR",
    "head": {
      "ref": "feature/test"
    }
  }
}
EOF
```

3. Run test workflow:
```bash
# List available workflows
act -l

# Run workflow with pull request event
act pull_request -e .act/pull_request.json

# Run specific workflow
act -W .github/workflows/main.yaml \
    -e .act/pull_request.json \
    --secret-file .act/.env \
    --container-architecture linux/amd64

# Run with verbose output
act -v pull_request -e .act/pull_request.json --secret-file .act/.env
```