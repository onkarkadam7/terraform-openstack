#!/bin/bash

#
# USAGE : ./add_prefix.sh $file_name prefix
sed -i "s/mst-/${2}-mst-/g" ${1}
sed -i "s/slv-/${2}-slv-/g" ${1}
sed -i "s/mgt-/${2}-mgt-/g" ${1}
sed -i "s/ui-/${2}-ui-/g" ${1}
sed -i "s/col-/${2}-col-/g" ${1}
sed -i "s/alert-/${2}-alert-/g" ${1}
sed -i "s/lb-/${2}-lb-/g" ${1}
