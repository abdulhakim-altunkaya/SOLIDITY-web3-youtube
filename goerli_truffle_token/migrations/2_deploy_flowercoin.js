const FlowerCoin = artifacts.require("FlowerCoin");

module.exports = function (deployer) {
  deployer.deploy(FlowerCoin);
};
