for i in {1..1000};
do
  echo ${i}
  peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n sacc -c '{"Args":["set","j'${i}'","0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789"]}'
done