set -e
java -version # require java
sudo dnf install -y libnsl
./fbo_ggs_Linux_x64_Oracle_shiphome/Disk1/runInstaller -silent -nowait -responseFile $PWD/fbo_ggs_Linux_x64_Oracle_shiphome/Disk1/response/oggcore.rsp
