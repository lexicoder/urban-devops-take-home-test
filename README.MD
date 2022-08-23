# Homework task for Urban

The goal of the task is to demonstrate how a candidate can create an environment with terraform. You should commit little and often to show your ways of working

## Requirements

- The environment should get created in Google Cloud Platform
- Create a VPC native Kubernetes cluster
- Host the provided Node.js application provided in the `app` folder in the created cluster with 3 replicas
- Use Terraform to orchestrate the deployment of the application
- Expose the provided application to the public internet
- Include at least 1 custom module in Terraform
- Add the prometheus-client to the provided application and expose one metric on a `/metrics` endpoint
- Write down some thoughts about what compromises you've applied (if any) and how would you like to improve the solution

# What gets evaluated

- Code quality
- Solution architecture
- Whether the code is "production-ready" (i.e. the environment starts and works as expected)
- How the code would scale to multiple environments
- Showing your work via the git commit history

Please share a Github link. If you want to keep it private, share it with the following users:
- rodolfobc
- gileze33
- v-lysenko
