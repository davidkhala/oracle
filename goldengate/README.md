https://docs.oracle.com/en/middleware/goldengate/core/19.1/understanding/understanding-oracle-goldengate.pdf
https://docs.oracle.com/en/middleware/goldengate/core/19.1/gghdb/using-oracle-goldengate-heterogeneous-databases.pdf

# design
Oracle GoldenGate creates trail files that contain the most recent changed data from the source database.

It then pushes these files to the server, where a process converts the trail file into standard SQL to be applied to the target database.

It is not designed to 
- Archive data: CDC, replication means copy, not move. It will be hard to avoid housekeep operation not to be sync.
## Compared to Oracle DB Data Guard
- DG simply maintains an exact **physical** replica of the production copy remotely. Thus it has to be **homogenous** and only between oracle to oracle
- Only one-way data replication
- DB is simpler than Goldengate in aspects
  - Configure: it’s very transparent to operate
  - Restrictions: It has no data type restrictions. There are no requirements for supplemental logging.
  - The need for performance tuning is also zero to none at the standby database.
- Performance: there are no performance implications for tables without a unique index or primary key with Data Guard.
- worse to meet RTO than Goldengate
# Download
https://www.oracle.com/middleware/technologies/goldengate-downloads.html
# tags
- log-based CDC
- logical replication
- java
# limitation
- Don't support for data types like XML and BLOB
- a minimum supplemental log should be enabled.
- some performance issues if the table doesn’t have any primary key.
