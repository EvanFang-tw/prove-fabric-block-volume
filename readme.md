```sh
./start.sh

docker exec -it cli bash

# in cli
./scripts/install-chaincode.sh

# query
peer chaincode query -C mychannel -n sacc -c '{"Args":["get", "0"]}'

# invoke
peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n sacc -c '{"Args":["set","key","value"]}'

# get height
peer channel getinfo -c mychannel

# fetch newest block and parse as a json file
peer channel fetch newest /opt/gopath/src/github.com/hyperledger/fabric/peer/artifacts/latest.block \
-c mychannel -o orderer.example.com:7050

configtxlator proto_decode --type=common.Block \
--input=/opt/gopath/src/github.com/hyperledger/fabric/peer/artifacts/latest.block \
> /opt/gopath/src/github.com/hyperledger/fabric/peer/artifacts/latest.block.json
```

---

## Simulate invoke transactions
```sh
# in cli
./scripts/run.sh
```

## start
```
16K     ./production/ledgersData/configHistory
16K     ./production/ledgersData/fileLock
20K     ./production/ledgersData/chains/index
20K     ./production/ledgersData/chains/chains/mychannel
24K     ./production/ledgersData/chains/chains
48K     ./production/ledgersData/chains
20K     ./production/ledgersData/historyLeveldb
20K     ./production/ledgersData/pvtdataStore
16K     ./production/ledgersData/bookkeeper
28K     ./production/ledgersData/ledgerProvider
168K    ./production/ledgersData
8.0K    ./production/chaincodes
16K     ./production/transientStore
196K    ./production
200K    .

block height: 2
```

## after insert `1000` transaction, each transaction contains 100 characters
```
16K     ./production/ledgersData/configHistory
16K     ./production/ledgersData/fileLock
304K    ./production/ledgersData/chains/index
3.2M    ./production/ledgersData/chains/chains/mychannel
3.2M    ./production/ledgersData/chains/chains
3.5M    ./production/ledgersData/chains
52K     ./production/ledgersData/historyLeveldb
28K     ./production/ledgersData/pvtdataStore
16K     ./production/ledgersData/bookkeeper
28K     ./production/ledgersData/ledgerProvider
3.7M    ./production/ledgersData
8.0K    ./production/chaincodes
16K     ./production/transientStore
3.7M    ./production
3.7M    .

block height: `108`
```

## after insert `2000` transaction, each transaction contains 100 characters
```
16K     ./production/ledgersData/configHistory
16K     ./production/ledgersData/fileLock
588K    ./production/ledgersData/chains/index
6.3M    ./production/ledgersData/chains/chains/mychannel
6.3M    ./production/ledgersData/chains/chains
6.9M    ./production/ledgersData/chains
80K     ./production/ledgersData/historyLeveldb
40K     ./production/ledgersData/pvtdataStore
16K     ./production/ledgersData/bookkeeper
28K     ./production/ledgersData/ledgerProvider
7.1M    ./production/ledgersData
8.0K    ./production/chaincodes
16K     ./production/transientStore
7.1M    ./production
7.1M    .

block height: `209`
```