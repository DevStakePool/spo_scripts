# spo_scripts
A set of BASH script that are able to query the Cardano blockchain via Koios for various utilities

## get_delegators_handles.sh
This script retrieves all the ADA Handles owned by stake pool delegators. The script takes a mandatory BECH32 stake pool ID as input and an optional epoch number.
```
$> ./get_delegators_handles.sh --help
Usage: get_delegators_handles.sh [BECH32_POOL_ID] [EPOCH?]
  --help    Prints this help
```
