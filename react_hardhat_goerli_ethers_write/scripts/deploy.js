
const hre = require("hardhat");

async function main() {

  const Flower = await hre.ethers.getContractFactory("Flower");
  const flower = await Flower.deploy();

  await flower.deployed();

  console.log("Flower deployed to:", flower.address);
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
