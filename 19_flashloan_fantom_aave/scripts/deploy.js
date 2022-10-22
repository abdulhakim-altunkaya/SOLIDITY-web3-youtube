
const hre = require("hardhat");

async function main() {

  const FlashLoan = await hre.ethers.getContractFactory("FlashLoan");
  const flashLoan = await FlashLoan.deploy("0xE339D30cBa24C70dCCb82B234589E3C83249e658");

  await flashLoan.deployed();

  console.log(`flashLoan deployed to ${flashLoan.address}`);
}


main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
