
SOFTWARE_LOCATION=${SOFTWARE_LOCATION}
connect(){
    $SOFTWARE_LOCATION/bin/adminclient
}
connectString (){
    echo "connect http://localhost:9000 AS oggadmin PASSWORD $ADMINISTRATOR_PASSWORD"
    
}
$@
