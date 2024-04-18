
# [Download](https://www.oracle.com/hk/integration/goldengate/free/download/)
- artifact: 
  - zip of installer: certified in oracle linux
    - [21c](https://download.oracle.com/otn-pub/otn_software/goldengate_free/ogg_21c_Linux_x64_Oracle_services_free_shiphome.zip)
    - [23c](https://download.oracle.com/otn-pub/otn_software/goldengate_free/ogg_23c_Linux_x64_Oracle_services_free_shiphome.zip)
  - [container image](https://container-registry.oracle.com/ords/f?p=113:4:114296956173771:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:1743,1743,Oracle%20GoldenGate%20Free,Oracle%20GoldenGate%20Free,1,0&cs=3Qkha6_ZTuXUfnY8bJeZzbtkNaHjkNUj9tPTKC3HfC3GORKHKZHaldfppn3h1ivle90V_7-fEJBzyaweCbNx5eA)

admin username: `oggadmin`

# admin password
assigned password contains 
- at least one lowercase, one uppercase, one digit, and one special 
- password length 8 - 30

random generated password can be found first 3 log lines
- `docker logs golden-gate | head -3`

To change password
- `docker exec golden-gate setPassword.sh $new_password`

# path
log path
- The rolling logs from api-server: `/u02/oggf/logs/oggf-apiserver*.log`
- logs for deploying OGG Microservice Architecture: `/u02/oggf/logs/deployment.log`

- GoldenGate system: `/u01`
- persistent GoldenGate data: `/u02`
- temporary GoldenGate data: `/u03`

# Limit
**No heterogeneous**: Connect to Oracle DB only
- no more than 20 gigabytes (GB) in size.
- down to Oracle Database 11.2.0.4
