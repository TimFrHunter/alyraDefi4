const Migrations = artifacts.require("Migrations");
const fpc = artifacts.require("FootballPlayerCard");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(fpc, "FootballPlayerCardToken721", "FPC");
};
