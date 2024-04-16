https://docs.oracle.com/en/middleware/goldengate/veridata/12.2.1.4/gvdad/introduction-oracle-goldengate-veridata.html#GUID-DD9C1FC7-F11A-4ADB-A6CC-E6F701448E00
# Initial comparison (row hash) step
1. rows are retrieved from the source and target tables with a query
  - **Heterogeneous**: columns are converted to a standardized data type format for accurate comparison
  - compare all primary key in raw content(value-for-value)
  - compare other columns by using a hash value
  - **customize**: You can specify column(s) using raw content comparison than hash. You can specify which rows to skip in delta
2. rows that appear to be out-of-sync are stored in a maybe out-of-sync (MOOS) queue in memory


Optional **delta**: it detects which data blocks were modified since a previous comparison
- To enable: in Web UI, click **Enable Delta Processing** on the **Compare Pair Configuration page** and the **Run/Execute Job page**

# Confirmation (COOS) step
confirm-out-of-sync (COOS) step involves predicated queries by using the rows extracted from the MOOS queue.

- Runing is parallel to the initial comparison step
- the confirmation of each row waits until a specified replication latency threshold expires.
  - After latency is accounted for, rows can be confirmed as persistently out-of-sync and are stored in one or more out-of-sync reports.

Status:
- **in-flight** (before sync): The row was out-of-sync in the initial comparison step, but it was updated.
  - It is assumed that replication or another mechanism applied the change, but Veridata was unable to confirm that the rows were in-sync.
- **in-sync**: The source row values were applied to the target row by replication or another method. 
  - It indicates that replication is working
  - It does not guarantee that the rows are synchronized at any particular moment if the underlying tables are continuously changing
- **persistently out-of-sync**: The row was not updated since the initial comparison step, and can be assumed to be out-of-sync.

# Viewing Comparison Results
2 type of reports: out-of-sync (OOS), comparison

By files 
- binary format
- XML format

By Web UI
  