#!/bin/bash

### DEV Stake Pool - Alessio Di Fazio - https://devstakepool.github.io
### Utility script that prints all the ADA handles owned by delegators of a stake pool
### Powered by https://www.koios.rest/

## Prints the help
print_help() {
    echo "Usage: get_delegators_handles.sh [BECH32_POOL_ID] [EPOCH?]"
    echo "  --help    Prints this help"
}

if [ -z "$1" ]
then
    print_help
    exit 1
fi


if [ "--help" = "$1" ]
then
    print_help
    exit 0
fi

HANDLE_POLICY_ID="f0ff48bbb7bbe9d59a40f1ce90e9e9d0ff5002ec48f232b49ca0fb9a"
pool_id=$1
epoch=$2
url="https://api.koios.rest/api/v0/pool_delegators?_pool_bech32=${pool_id}"
SILENT="--silent"
epoch_arg=""

if [ -n "${epoch}" ]; then
    epoch_arg="&_epoch_no=${epoch}"
    echo "Filtering for EPOCH $epoch"
fi

echo -n "Getting delegator list for stake pool ${pool_id}..."
json_response=`curl ${SILENT} -X GET "${url}${epoch_arg}" -H "Accept: application/json"`

if [ $? -eq 0 ]; then
    echo " OK"
else
    echo " KO"
fi

all_stake_addresses=`echo $json_response | jq -r .[].stake_address`
url="https://api.koios.rest/api/v0/account_assets?_address="
for stake in `echo $all_stake_addresses`; do
    # check if the stake has any handles
    delegator_assets_json=`curl ${SILENT} -X GET "${url}${stake}" -H "Accept: application/json"`
    handles=`echo $delegator_assets_json | jq --arg handle ${HANDLE_POLICY_ID} -r '.[] | select(.asset_policy == $handle).asset_name'`

    if [ -n "${handles}" ]; then
        echo "${stake} -> `echo ${handles} | awk -vFS='\n' '{print $0}'`"
    fi
done

