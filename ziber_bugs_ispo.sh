#!/bin/bash

### DEV Stake Pool - Alessio Di Fazio - https://devstakepool.github.io
### Utility script checks the 10 epochs of the ZiberBugs ISPO with xSPO pools and exports it into CSV format
### Powered by https://www.koios.rest/
### ISPO: https://ziberbugs.io/

## Prints the help
print_help() {
    echo "Usage: ziber_bugs_ispo.sh"
    echo "  --help    Prints this help"
}


if [ "--help" = "$1" ]
then
    print_help
    exit 0
fi

# xSPO pool IDs
POOL_IDS=("pool1e2tl2w0x4puw0f7c04mznq4qz6kxjkwhvuvusgf2fgu7q4d6ghv" "pool12wpfng6cu7dz38yduaul3ngfm44xhv5xmech68m5fwe4wu77udd")

# The epochs
EPOCHS=($(seq 333 340))

for p in ${POOL_IDS[@]}; do
    for e in ${EPOCHS[@]}; do
        url="https://api.koios.rest/api/v0/pool_delegators?_pool_bech32=${p}&_epoch_no=${e}"
        SILENT="--silent"

        json_response=`curl ${SILENT} -X GET "${url}${epoch_arg}" -H "Accept: application/json"`

        if [ "$?" != "0" ]; then
            echo "[WARNING] REST call did not return a proper code: ${?}"
        fi
        echo $json_response | jq -r '.[] | [.stake_address, .amount] | @tsv' | awk -v p=${p} -v e=${e} '{print p","e","$1","$2}'
    done
done
