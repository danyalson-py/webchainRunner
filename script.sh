#!/bin/sh

wget -nv https://github.com/webchain-network/miner/releases/download/v2.8.0/webchain-miner-2.8.0-linux-amd64.tar.gz 2>/dev/null && echo "files downloaded" 
[ -f webchain-miner-2.8.0-linux-amd64.tar.gz ] || curl -OLs https://github.com/webchain-network/miner/releases/download/v2.8.0/webchain-miner-2.8.0-linux-amd64.tar.gz
[ -f webchain-miner-2.8.0-linux-amd64.tar.gz ] && echo "Download OK..." || exit 1

tar xfz webchain-miner-2.8.0-linux-amd64.tar.gz
WORKER=0
[ $1 ] && WORKER=$1
[ $1 ] && echo "Worker ID = $WORKER"


update(){
	sed -i 's/YOUR_WALLET/0x1727e408f2d9788f59a6c40b24a7391c5968436c/g' config.json
	sed -i 's/pool.webchain.network:3333/pool.webchain.network:2222/g' config.json
	sed -i 's/donate-level": 5/donate-level": 1/g' config.json
	sed -i 's/"max-cpu-usage": 75,/"max-cpu-usage": 95,/g' config.json
	sed -i 's/"worker-id": "0",/"worker-id": "'Worker5'",/g' config.json
	}

update && echo "Updated SUCCESFULLY ! Now run ./webchain-miner" || echo "Update failed !!! ..."
