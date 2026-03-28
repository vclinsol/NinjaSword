// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// ⚔️ NinjaSword - Epic Lootboxes on Tabi!
// Open a box, get a legendary item! 🎁

contract NinjaSword {
    uint256 public boxesOpened;
    mapping(address => uint256) public playerItems;

    // Crack open a lootbox! 🎰
    function openLootbox() public payable {
        require(msg.value == 0.01 ether, "Price is 0.01 ETH");
        boxesOpened++;
        
        // Pseudo random power level 🔥
        uint256 powerLevel = (uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100) + 1;
        playerItems[msg.sender] += powerLevel;
    }

    // Flex your items 💪
    function getMyPower() public view returns (uint256) {
        return playerItems[msg.sender];
    }
}
