// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@api3/contracts/api3-server-v1/proxies/interfaces/IProxy.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract PriceFeed is Ownable {
    address public proxyID;
    address public proxyID2;
    address public proxyID3;

    constructor() Ownable(msg.sender) {}

    function setupFeed_one(address _priceFeed) external onlyOwner {
        proxyID = _priceFeed;
    }

    function setupFeed_two(address _priceFeed) external onlyOwner {
        proxyID2 = _priceFeed;
    }

    function setupFeed_three(address _priceFeed) external onlyOwner {
        proxyID3 = _priceFeed;
    }

    function readDataFeed() public view returns (uint256, uint256) {
        (int224 value, uint256 timestamp) = IProxy(proxyID).read();
        uint256 price = uint224(value);
        return (price, timestamp);
    }

    function readDataFeed2() public view returns (uint256, uint256) {
        (int224 value, uint256 timestamp) = IProxy(proxyID2).read();
        uint256 price = uint224(value);
        return (price, timestamp);
    }

    function readDataFeed3() public view returns (uint256, uint256) {
        (int224 value, uint256 timestamp) = IProxy(proxyID3).read();
        uint256 price = uint224(value);
        return (price, timestamp);
    }
}
