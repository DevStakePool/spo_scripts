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
```$> ./get_delegators_handles.sh pool1e2tl2w0x4puw0f7c04mznq4qz6kxjkwhvuvusgf2fgu7q4d6ghv
Getting delegator list for stake pool pool1e2tl2w0x4puw0f7c04mznq4qz6kxjkwhvuvusgf2fgu7q4d6ghv... OK
stake1u8uekde7k8x8n9lh0zjnhymz66sqdpa0ms02z8cshajptac0d3j32 -> alessio.dev mr.cardano
stake1ux5jnwn4htqcpc3wsqy0jp8hnpkvqhpwjxa3e4w872297msttjkmt -> i.muppet
stake1u825hvc6efdr8f5mt0zwxv2fx360eg86vfymua2dgmw0ujsf0kx4g -> kunos
...
...
...
```
