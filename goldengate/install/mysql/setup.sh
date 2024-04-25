set -e
SOFTWARE_LOCATION=${SOFTWARE_LOCATION:-$HOME/goldengate/mysql/}
goldengate_installer_home=${goldengate_installer_home:-$HOME/ggs_Linux_x64_MySQL_services_shiphome/Disk1/}
configure-install() {
    

    INVENTORY_LOCATION=${INVENTORY_LOCATION:-/tmp/Oracle/Inventory}

    local configureFile=$goldengate_installer_home/response/oggcore.rsp

    curl -o $configureFile https://raw.githubusercontent.com/davidkhala/oracle/main/goldengate/install/mysql/oggcore-base.rsp
    curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/editors.sh | bash -s configure SOFTWARE_LOCATION=$SOFTWARE_LOCATION $configureFile
    curl https://raw.githubusercontent.com/davidkhala/linux-utils/main/editors.sh | bash -s configure INVENTORY_LOCATION=$INVENTORY_LOCATION $configureFile
    

}
install() {
    
    java -version
    OGG_SOFTWARE_HOME=$SOFTWARE_LOCATION
    $goldengate_installer_home/runInstaller -silent -nowait -responseFile $goldengate_installer_home/response/oggcore.rsp
}

deployment() {
    :
}
configure-deployment() {
    :
}
$@
# # Create Deployment
# ./oggca.sh -silent -responseFile ?? # TODO
