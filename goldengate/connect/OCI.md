https://docs.oracle.com/en/cloud/paas/goldengate-service/cqcgg/#GUID-F23C205F-7970-48A4-8132-EEB20690A36D
# Deployment
- OCI GoldenGate deployments require a **private subnet** with a **NAT Gateway**.
- A route table with a route rule redirecting traffic to the NAT Gateway for the private subnet must be available.
- Optionally, you can ‘Enable GoldenGate console public access’ and OCI GoldenGate creates a Flexible Load Balancer in the subnet of your choosing, in your tenancy, that connects to the OCI GoldenGate deployment, and creates a public IP. If so, network traffic uses port 443 and you must create a route table with a route rule that redirects traffic to the Internet Gateway.
