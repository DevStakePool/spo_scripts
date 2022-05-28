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
POOL_IDS=(
"pool1mrxg6svcug7mc459ce5zum4qd6p0hkfc08jzpphxfnxzz8yf7ll"
"pool1668w66pcrdjmavz0c7vym7s4d3xm7578jy0fqzhk55677t4etud"
"pool19ddv2pe786q8zqjzvw50u60y2aau7wl76sg3pnkc4j92wcx2kp2"
"pool1zytydvyy3qztrs8l2xyggvkfcjctp23m2hc3aj7sudnzgny79cg"
"pool1gh06f56tnkj6uhlfrlntwnczlfm6tszmm6umga3anevn2tvcds4"
"pool1qadgwr92pgx0yz3u9n63f0s9ugryaud6wxers850z6sfu06y3rg"
"pool16p8y0pzx8yx7vz6eqksw9xjhh3tzeymvxcstrgtk8ncw75356yw"
"pool17r3u34ywld6sehe9dd5t40ygq7rmc6yfw2k0h0hpllznwlmwsnn"
"pool19gzu2dyp0g9e0nsvtg34fdhrtgr8c5jq37nscalqkh3hsjmas69"
"pool1cspe7naf0mtntwyysqxk6czah3jlh6v4cja8pdfju932yxsehnm"
"pool1dkt4rqtjs6j6d8snna60s2g002ddcj5h62nee59mvsznk20q300"
"pool17k2dpgvx8spkdhgf5j7x5u7pqjpvlwa76sugwen8l3xtk7kq3c4"
"pool1vfayajkdc0gw876lax5va6ygpfpsd8kz73k4y977emm3clnxlm5"
"pool1vx5z22mlkx30mcda48rt6zf8n9tsraueulavsgnuvx45ug2etga"
"pool13vc4ekwpky5vtnl8pyj60phkmwtv7gsthn4g525udt7mjycs85v"
"pool16cdtqyk0fvxzfkhjg3esjcuty4tnlpds5lj0lkmqmwdjyzaj7p8"
"pool188rwerlxm4se6qzlz7g9mh3zrccuh492ma0wemuuvyf3zgstqy4"
"pool12ndf7w5f4fdn746s5zlay4aexvcsjncnnmjwfp8falascjqav3y"
"pool17xh922cr9skc0fqk7sr8at6xx6eluh5qyv9p7ca2x0mtc3st0mz"
"pool1ex3e0w92rktrqvyen48dl58cp8efp7vfn3ealgdd8fkhqqychgd"
"pool1wggqaqs4pw2l4vml0k0p2kmvpq7pme3fl6smwc8cjjhvvuun9ww"
"pool1ewrm7y47s9hv6hxku9n5gfnsuspymp0qqpwgvgm9rvm37cek2h6"
"pool16lwqfp7cpvzwn6mhu0gj3h4aa5k6j9my0he4mgjjva5f7vvnkw2"
"pool1dqhaw0h2f4ehpdhh57quszcj22qhkglhg6yvaf39w3clxdl2kpy"
"pool1qhs3cf9ymc2nvmrd2j8cs36cj9jdqgnqk6s9ngyvy2lz5s8rak8"
"pool1helzgcd9sjm9xtyh9mw2wy06gekh6r52s6mx987q0p8lvklwura"
"pool1tnl3yxmj8848vq6meduhz9n5520a7dwsh05r5gfyvlatj87k3jl"
"pool1u0u2s080a5plun4acn6s70xa3q98ct7skt88l7w6nnwwyl9ecym"
"pool1kcrr7re05pwesye0zh00a4xxnsrw5c29rd82fn4qecdcqu5rue3"
"pool13qppafmw3vq5rl4ewmxv7zy84x3rshx9sdczs0zq40cxu0dqkrg"
"pool1dq2tg9rn6txuxtcjggwnj38mwq98cvewm3yg8zkdw7qu5nzg7ge"
"pool1q8a7ym63gurl72wr32je0tv0lp4p2uh8vzzc6rn6un7ryslvqmu"
"pool18zf8txwv8lmtpq2src8wrhz0pjut5qft8h5tfxnctwc95r7jvvj"
"pool17taqml487n9t4r9a6ppvf9qv0qlw2lu4zcrzwfdsfcv6xp7uqym"
"pool1qv785q9wx056p7ngq2ec3n86tj5kx0t3ygcug8zx3sknj038rsd"
"pool1qznyv8g4vxv8ys05rs6dgtzutqc2z9gs6vq85vkn8uq8u0c83we"
"pool17etnr2ngwpnqwuvdzszzd36u67kzcsrs8scuxf0a63hezy9zvpv"
"pool1dum9ya0d8dufl3alf4xska5acuq3w4p2a6fu5v50jnh9xzexsxt"
"pool1mukzsec605hfk2tsx4r4xd2rjfjytua8puge5pa0g82rgqm0kt9"
"pool18qzks8vdf0yu0u5ccf8aaj35q6zfutdcfgrssuvdjmgtyykr922"
"pool1hy3fjpuq844ttntzcnr3j07sr6ljh79ef6ny3u8hdd8w7zhrwgz"
"pool1n7s5kpymwd0zsld8q23tpf7z5esjaqwmnnzzssee5630zpx5ww0"
"pool1xdcg6kg0g4y3wqf92f8uh44urz06suglhff036k5yak2g0m8zlc"
"pool18qddv82sx8p22uxzdrf0qx9lkewxadlr9ef45kpcf7dzz3n56qv"
"pool12wpfng6cu7dz38yduaul3ngfm44xhv5xmech68m5fwe4wu77udd"
"pool18rpw5dwfywfrzjuy7uzn2cetrw9v85aan8a80p3fdvtqcxykkqu"
"pool1keasvddt9vndl8jyhg204s6kqusv5zgzg3kk3l3g949ew402ahe"
"pool19xyfanyp28j6j07dxgwdjp0wur6seqmyyu64qgzstzl7s47pvpj"
"pool1tmt8thfaqeqv499l3s7k5kl64s84nycvnx55ll3ksm9hq50p0ks"
"pool1zt2d9aa8ck62uyy985yny47hr0f6cmf2hnxzke0up0lc7zcp65f"
"pool1rs3qqyhfslp59mztf3kw5pzsr5x0qq69nqztpecp3578xq64cd3"
"pool1lkuwrel3s8er6v0snw69gumsaugydz9n0vl87n7mygh576mwcy0"
"pool1wz4euuc8r3gfya335gvpxl2nuajkvkjh3d6ylm4w83wcz7lqxc6"
"pool1g8w64u3sx9mrvhwrdfvysw4g4wnffkjfp5zds3ur6svwzdhwhx9"
"pool1eu8knr403p82ythegskwmf8w6v8l2w858d8jz7qvvqzj7ryech4"
"pool1cg559cdc25fkvs73umj6w5nxlwy3mpmj02xt7p4v69eqs5ncz9k"
"pool170hmssk80z2ameg7jhj5m8psnkjejcc77vfpd0875yggxhhntd0"
"pool1wntxmftndrsj7y4aqles8knl3nfuyj22l83jun02yyx9s962gm3"
"pool1fwgyndndjf4d5u3ypzuma64wnmea9llzxa7ek9lkupuw786zv32"
"pool1e2tl2w0x4puw0f7c04mznq4qz6kxjkwhvuvusgf2fgu7q4d6ghv"
"pool1zn4wnk52kmfjy9mw4z85p6wn9kzrn94l9h5gys8r2k2w57mdnhh"
"pool19rs2895l5ghjn4d38c9qpqn2d44amqx7cqd3easdav5m786w6ng"
"pool15g3cwwmd3qks03ztl5464j044jasn3dcs6zcgpxtxadfj86lvf2")

# The epochs
EPOCHS=($(seq 339 340))

echo "ticker,pool_id_bech32,epoch,stake_address,lovelace"
for p in ${POOL_IDS[@]}; do

    # Getting pool list
    url="https://api.koios.rest/api/v0/pool_metadata"
    SILENT="--silent"
    json_response_pool_meta=`curl ${SILENT} -X POST ${url} -d "{\"_pool_bech32_ids\": [\"${p}\"]}" \
        -H "Accept: application/json" -H "Content-Type: application/json"`

    if [ "$?" != "0" ]; then
            echo "[ERROR] REST call (metadata) did not return a proper code: ${?}" >&2
    fi

    pool_ticker=$(echo $json_response_pool_meta | jq -r '.[] | .meta_json.ticker')

    for e in ${EPOCHS[@]}; do
        url="https://api.koios.rest/api/v0/pool_delegators?_pool_bech32=${p}&_epoch_no=${e}"
        SILENT="--silent"

        json_response=`curl ${SILENT} -X GET "${url}${epoch_arg}" -H "Accept: application/json"`

        if [ "$?" != "0" ]; then
            echo "[ERROR] REST call did not return a proper code: ${?}" >&2
        fi
        echo $json_response | jq -r '.[] | [.stake_address, .amount] | @tsv' | \
            awk -v t=${pool_ticker} -v p=${p} -v e=${e} '{print t","p","e","$1","$2}'
    done
done
