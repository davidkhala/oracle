https://docs.oracle.com/en/middleware/goldengate/veridata/12.2.1.4/gvdad/introduction-oracle-goldengate-veridata.html#GUID-8CBC0FC2-0CAB-4918-BC2B-FE08F408B2E3
# Oracle GoldenGate Veridata
A patent-pending technology that operates against live databases to selectively compare datasets at very high speeds without interrupting ongoing business processes and then fix any out-of-sync data.

It compares one set of data to another and identifies data that is out-of-sync, and allows you to repair any data that is found out-of-sync
- In case of source log is out-of-sync with source data



## components
![Architecture](https://docs.oracle.com/en/middleware/goldengate/veridata/12.2.1.4/gvdad/img/gvdad_overview.png)
### Server
The Oracle GoldenGate Veridata Server
- Coordinate the execution of Oracle GoldenGate Veridata tasks
- Sort rows
- Compare data
- Confirm out-of-sync data
- Produce a report for review

### Web UI
Oracle GoldenGate Veridata Web User Interface
- Configure comparison objects and rules
- Initiate comparisons
- Review the status and output of comparisons
- Repair out-of-sync data
- Review out-of-sync data

### Repository
Oracle GoldenGate Veridata Repository persists configuration information
- Out-of-sync data is not stored in the repository, but on the server’s file system.

### Agent
The Oracle GoldenGate Veridata Agent
- Hash rows for initial comparison
- Fetch and update rows to repair out-of-sync data
- Return column-level details for out-of-sync rows

### CLI utils
`vericom`: run comparisons by using automated programs

`veridata_import`: Maps comparison objects and rules in an XML file and imports it into the repository

`veridata_export`: Maps comparison objects and rules in the repository and exports them to an XML file

`veridata_param_process`: Helps to use the Oracle GoldenGate parameter files(?)

`reportutil`: view encrypted report files and out-of-sync data.

### Optional: Manager
Oracle GoldenGate Veridata Manager is required only for the NonStop platform
- It is part of the C++ agent, not used in a Java agent.



