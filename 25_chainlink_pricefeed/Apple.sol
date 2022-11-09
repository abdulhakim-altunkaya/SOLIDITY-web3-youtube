// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Apple {

    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Fantom Testnet
     * Aggregator: BTC/USD
     * Address: 0x65E8d79f3e8e36fE48eC31A2ae935e92F5bBF529
     */
    constructor() {
        priceFeed = AggregatorV3Interface(0x65E8d79f3e8e36fE48eC31A2ae935e92F5bBF529);
    }

    function getLatestPrice() public view returns (int) {
        (
            /*uint80 roundID*/,
            int price,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return price / 100000000;
    }
}
