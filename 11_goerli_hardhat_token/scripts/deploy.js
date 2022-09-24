const hre = require("hardhat");

async function main() {

  const GoatToken = await hre.ethers.getContractFactory("GoatToken");
  const goatToken = await GoatToken.deploy();

  await goatToken.deployed();

  console.log("GoatToken deployed to:", goatToken.address);
}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
