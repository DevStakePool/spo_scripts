# spo_scripts
A set of BASH script that are able to query the Cardano blockchain via Koios for various utilities

## get_delegators_handles.sh
This script retrieves all the ADA Handles owned by stake pool delegators. The script takes a mandatory BECH32 stake pool ID as input and an optional epoch number.
```
$> ./get_delegators_handles.sh --help
Usage: get_delegators_handles.sh [BECH32_POOL_ID] [EPOCH?]
  --help    Prints this help
```
Output:
```$> ./get_delegators_handles.sh pool1ewrm7y47s9hv6hxku9n5gfnsuspymp0qqpwgvgm9rvm37cek2h6
Getting delegator list for stake pool pool1ewrm7y47s9hv6hxku9n5gfnsuspymp0qqpwgvgm9rvm37cek2h6... OK
stake1uxd5gjm00hkmsusqh5yp57zxfwx0e4mwwzlrvx8vw6x2wkgj77zpt -> ud1
stake1uxukkfdemg7ylmvnamamttt29glvzh6cjx4fmmmnyelhxrg5rphvp -> fo1
stake1uxhaajhklhc8mfqzl8skdz47jd82w662xwcn6qc7jlkqpds7jc7zp -> wm1
stake1uyeczqgky992auys28yygkz49tljguk4ng9f442kne3hhfqaz6xx9 -> jairo-barcenas jairo_barcenas jairobarcenas
stake1u8axl7kru4e4akj97kng09c8h7ymky4zhh3yk8mcr2n4lyghkavhy -> ltp twno1
stake1uxszu8z89j8ztmhgy3jl2ef0fgequdvqaegr3x3pxzfas2qesm6lx -> abs age axis bald blueberry deck duty glad nevermind
stake1u8l30p8sw26rawmhxhzqp07fh7fa9hragta0lpk9p7hs49cww38rf -> 18 donut_nu kelvin
...
```
