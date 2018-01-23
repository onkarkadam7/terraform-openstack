#!/bin/bash

#
# USAGE : ./test.sh $file_name
#         ./test.sh terraform.tf 
sed -i "s/mst-/mst-0/g" ${1}
sed -i "s/slv-/slv-0/g" ${1}
sed -i "s/mgt-/mgt-0/g" ${1}
sed -i "s/ui-/ui-0/g" ${1}
sed -i "s/col-/col-0/g" ${1}
sed -i "s/alert-/alert-0/g" ${1}
sed -i "s/lb-/lb-0/g" ${1}
