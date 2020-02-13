#!/bin/bash
peer chaincode install -n sacc -v 1.0 -p github.com/sacc
peer chaincode instantiate -o orderer.example.com:7050 -C mychannel -n sacc -v 1.0 -c '{"Args":["0", "0"]}'