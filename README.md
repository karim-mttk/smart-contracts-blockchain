# Creating contracts

The contract creation process has been refined through four iterations:

1. Initially, a contract is created on a local Ganache environment. The [deploy.js ](https://github.com/karim-mttk/smart-contracts-blockchain/blob/c8b4ce89160ca4ff55ea08a5e5dda775e6df31c8/deploy.js) file is used to modify the private key and RPC URL.

2. In order to better manage the private key and RPC URL, a [.env ](https://github.com/karim-mttk/smart-contracts-blockchain/blob/512f8e79bad29d66fd04abb521fc1406f656bad9/.env) file is created.

3. For added security, the private key is encrypted and decrypted using a password.

4. Finally, the contract is deployed on the Sepolia testnet and saved on the Ethereum blockchain. This allows the contract to be retrieved using its address.
