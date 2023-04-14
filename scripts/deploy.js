// imports

const { ethers, run, network } = require("hardhat");

//async main
async function main() {
  const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage");
  console.log("**Deploying contract!** Pls wait...");
  const simpleStorage = await SimpleStorageFactory.deploy();
  await simpleStorage.deployed();
  /*private key and RPC url is automatically set in hardhat.config*/
  console.log(`Deployed to: ${simpleStorage.address}`);
  console.log(network.config);
  //console.log(`Network: ${network.name}`);
  if (network.config.chainId === 11155111 && process.env.ETHERSCAN_API_KEY) {
    await simpleStorage.deployTransaction.wait(6);
    await verify(simpleStorage.address, []);
  }
  const currentValue = await simpleStorage.retrieve();
  console.log(`Current value: ${currentValue}`);

  const tranactionResponse = await simpleStorage.store(7);
  await tranactionResponse.wait(1);
  const updatedValue = await simpleStorage.retrieve();
  console.log(`Updated value: ${updatedValue}`);
}

async function verify(contractAddress, args) {
  console.log("*Verifying contract...*");
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    });
  } catch (error) {
    if (error.message.includes("Contract source code already verified")) {
      console.log("Contract source code already verified");
    } else {
      console.log(error);
    }
  }
}

//main
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
