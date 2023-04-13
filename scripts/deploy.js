// imports

const { ethers } = require("hardhat");

//async main
async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
  console.log("**Deploying contract!** Pls wait...");
  const simpleStorage = await SimpleStorageFactory.deploy();
  await simpleStorage.deployed();
  /*private key and RPC url is automatically set in hardhat.config*/
  console.log(`Deployed to: ${simpleStorage.address}`);
}

//main
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
