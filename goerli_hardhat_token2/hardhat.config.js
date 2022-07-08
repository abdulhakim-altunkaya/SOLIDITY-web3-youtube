require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: "https://eth-goerli.g.alchemy.com/v2/7TZSJsHL5zi8cHRKl2EWML5ZiUGCMj6j",
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};
