require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
const { PRIVATE_KEY, INFURA_API_KEY } = process.env;
const ZIRCUIT_PRIVATE_KEY = "1c85380beb1605aabbf168ef7c1c313795870a2584ab0e5b3f7c10012269fc1a";

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    linea_goerli: {
      url: `https://linea-goerli.infura.io/v3/${"870c014e78094a98b5cdc38ac6090e5e"}`,
      accounts: ["0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"],
    },
    linea_sepolia: {
      url: `https://linea-sepolia.infura.io/v3/${"0x870c014e78094a98b5cdc38ac6090e5e"}`,
      accounts: ["0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"],
    },
    linea_mainnet: {
      url: `https://linea-mainnet.infura.io/v3/${"870c014e78094a98b5cdc38ac6090e5e"}`,
      accounts: ["0x0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"],
    },
     zircuit: {
      url: `https://zircuit1.p2pify.com`,
      accounts: [ZIRCUIT_PRIVATE_KEY]
    }
  },
};
