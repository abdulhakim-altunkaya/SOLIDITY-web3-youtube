const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("AppleModule", (m) => {

  const appleContract = m.contract("Apple", []);

  return { appleContract };
});
