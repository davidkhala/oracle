set -e
SOFTWARE_LOCATION=${SOFTWARE_LOCATION:-$HOME/goldengate/mysql/}
goldengate_installer_home=${goldengate_installer_home:-$HOME/ggs_Linux_x64_MySQL_services_shiphome/Disk1}
OGG_DEPLOYMENT_HOME=${OGG_DEPLOYMENT_HOME:-$HOME/goldengate/deployment}

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
    bash editors.sh configure SERVICEMANAGER_DEPLOYMENT_HOME=$OGG_DEPLOYMENT_HOME/ServiceManager/ $configureFile
    bash editors.sh configure OGG_DEPLOYMENT_HOME=$OGG_DEPLOYMENT_HOME/ $configureFile
    bash editors.sh configure HOST_SERVICEMANAGER=$(hostname) $configureFile
    bash editors.sh configure OGG_SOFTWARE_HOME=$SOFTWARE_LOCATION $configureFile

    rm editors.sh
    
}
deployment() {
    $SOFTWARE_LOCATION/bin/oggca.sh -silent -responseFile $goldengate_installer_home/response/oggca.rsp
}
$@
