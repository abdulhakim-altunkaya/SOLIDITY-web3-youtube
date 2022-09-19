0) Create a hardhat project, install all dependencies, and dont forget to install
dotenv package. 
npm install dotenv

1) Add Ganache to Metamask: Go to Metamask extension in your browser
Click on "Add Network"
New RPC URL	: HTTP://127.0.0.1:7545
Chain id	: 1337
Currency	: ETH
Network Name: localganache

2) Go to Ganache Application
Click on key symbol of any account you see
Then copy the private key of the account

3) Go to Metamask extension,
Click on "Account" symbol on top right
Clik on "Import Account"
Paste the private key from step 2 and save

4) Go to you hardhat project folder

4.1) Create a ".env" file at the root of the folder and type inside
PRIVATE_KEY=".....paste here the private key from step 2...."
PROVIDER_URL=`HTTP://127.0.0.1:7545`

4.2) Go to hardhat.config.js and put inside:

require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.1",
  networks: {
    localganache: {
      url: process.env.PROVIDER_URL,
      accounts: [`0x${process.env.PRIVATE_KEY}`]
    }
  }
};

5) Deploy contract:
npx hardhat run ./scripts/deploy.js --network localganache