# Classic Architecture
- the main product installation method before 12c (12.3.0.1) release.
## Use case
- A static extraction of data records from one database and the loading of those records to another database.
- **heterogeneous**: Capture from heterogeneous database sources and replication to heterogeneous database or a file
- Continuous extraction and replication of transactional DML operations and DDL changes to keep source and target data consistent.



# Microservices Architecture (MA)
a microservices architecture that enables REST services as part of the Oracle GoldenGate environment.
- API end-points can be leveraged for remote configuration, administration and monitoring through web based consoles
- an enhanced command line interface
- PL/SQL and scripting languages.
- WebSockets for streaming data
## Use case
- Large scale and cloud deployments
- Simpler management of multiple implementations of Oracle GoldenGate environments and control user access for the different aspects of Oracle GoldenGate setup and monitoring.
- Support system managed database sharding to deliver fine-grained, multi-master replication where all shards are writable, and each shard can be partially replicated to other shards within a shardgroup.
- Coordination with other systems and services in an Oracle Database environment.??
– Custom embedding of Oracle GoldenGate into applications by using API endpoint
- **Connect Oracle only**: Only supports the Oracle database for an end-to-end MA-only topology.

