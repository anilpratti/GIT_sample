name 'load-balancer'
description 'load balancer role'
run_list "role[base]","recipe[mychef-client]","recipe[myhaproxy]"

