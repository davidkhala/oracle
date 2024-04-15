
admin username: `oggadmin`

# admin password
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
