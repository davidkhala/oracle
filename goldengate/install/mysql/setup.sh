set -e
SOFTWARE_LOCATION=${SOFTWARE_LOCATION:-$HOME/goldengate/mysql/}
goldengate_installer_home=${goldengate_installer_home:-$HOME/ggs_Linux_x64_MySQL_services_shiphome/Disk1}
# For deployment
OGG_DEPLOYMENT_HOME=${OGG_DEPLOYMENT_HOME:-$HOME/goldengate/deployment}
SERVICEMANAGER_DEPLOYMENT_HOME=$OGG_DEPLOYMENT_HOME/ServiceManager
configure-install() {
    

    INVENTORY_LOCATION=${INVENTORY_LOCATION:-/tmp/Oracle/Inventory}

    local configureFile=$goldengate_installer_home/response/oggcore.rsp

    curl -o $configureFile https://raw.githubusercontent.com/davidkhala/oracle/main/goldengate/install/mysql/oggcore-base.rsp
    curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/editors.sh | bash -s configure SOFTWARE_LOCATION=$SOFTWARE_LOCATION $configureFile
    curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/editors.sh | bash -s configure INVENTORY_LOCATION=$INVENTORY_LOCATION $configureFile
    

}
install() {
    
    java -version
    $goldengate_installer_home/runInstaller -silent -nowait -responseFile $goldengate_installer_home/response/oggcore.rsp
}

configure-deployment() {
    local configureFile=$goldengate_installer_home/response/oggca.rsp

    curl -o $configureFile https://raw.githubusercontent.com/davidkhala/oracle/main/goldengate/install/oggca-base.rsp

    curl -o editors.sh https://raw.githubusercontent.com/davidkhala/linux-utils/main/editors.sh
    bash editors.sh configure ADMINISTRATOR_PASSWORD=${ADMINISTRATOR_PASSWORD:-"P@ssw0rd"} $configureFile
    bash editors.sh configure SERVICEMANAGER_DEPLOYMENT_HOME=$SERVICEMANAGER_DEPLOYMENT_HOME $configureFile
    bash editors.sh configure OGG_DEPLOYMENT_HOME=$OGG_DEPLOYMENT_HOME/ $configureFile
    bash editors.sh configure HOST_SERVICEMANAGER=$(hostname) $configureFile
    bash editors.sh configure OGG_SOFTWARE_HOME=$SOFTWARE_LOCATION $configureFile

    rm editors.sh
    
}
deployment() {
    wget https://rpmfind.net/linux/centos/8-stream/AppStream/x86_64/os/Packages/compat-openssl10-1.0.2o-4.el8.x86_64.rpm
    sudo dnf install -y compat-openssl10-1.0.2o-4.el8.x86_64.rpm
    $SOFTWARE_LOCATION/bin/oggca.sh -silent -responseFile $goldengate_installer_home/response/oggca.rsp
    # setup systemd
    sudo $SERVICEMANAGER_DEPLOYMENT_HOME/bin/registerServiceManager.sh
    
    rm compat-openssl10-1.0.2o-4.el8.x86_64.rpm
}
status(){
    systemctl status OracleGoldenGate
}

$@
