//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "../lib/openzeppelin-contracts/contracts//access/Ownable.sol";

contract SimpleMint is ERC721 , Ownable {

    uint256 public mintPrice = 0.05 ether; 
    uint256 public totalSupply;
    uint256 public maxSupply;

    bool public isMintEnabled;
    mapping(address => uint256) public mintedWallets;

    constructor() payable ERC721("flash","F1") Ownable(msg.sender){
        maxSupply = 2;
    }

    function toggleIsMintEnabled() external onlyOwner {
        isMintEnabled = !isMintEnabled;
    }

    function setMaxSupply(uint256 maxSupply_) external onlyOwner {
        maxSupply = maxSupply_;
    }


    function mint() external payable {
        require(isMintEnabled, "minting is not enabled");
        require(mintedWallets[msg.sender] < 1, "exceeds max per wallet");
        require(msg.value == mintPrice, "wrong value");
        require(maxSupply > totalSupply, "sold out");

        mintedWallets[msg.sender]++;
        totalSupply++;

        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }
}