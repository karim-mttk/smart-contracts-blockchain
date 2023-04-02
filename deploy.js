// This script deploys the contract to the local blockchain
//NOTES: use $ npm install ethers@5.7.2 and change the ethers version in package.json to 5.7.2

const ethers = require("ethers");
const fs = require("fs-extra");
//require("dotenv").config();

async function main() {
  //http://127.0.0.1:7545
  let provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:7545");

  // check if the connection was successful
  provider
    .getNetwork()
    .then((network) => {
      console.log(`Connected to network ${network.name}`);
    })
    .catch((error) => {
      console.error(`Could not connect to network: ${error}`);
    });

  let wallet = new ethers.Wallet(
    "0x115c05f81e5818ea91a908c0b6e119dbe6ebbb0e629eb0b2c443fbae8a40a301",
    provider
  );
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);
  console.log("Deploying contract, **pls wait...");
  const contract = await contractFactory.deploy();
  console.log(contract);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
