# Deployment
Subnet requires a **NAT Gateway**
- OCI GoldenGate deployments require a VCN with at least a private subnet with a **NAT Gateway**.
- A route table with a route rule redirecting traffic to the NAT Gateway for the private subnet must be available.
