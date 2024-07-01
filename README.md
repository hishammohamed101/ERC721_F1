
## SimpleMint Contract
# Overview

This project implements a basic Ethereum smart contract (SimpleMint) using Solidity. The contract allows users to mint ERC721 tokens (NFTs) under specified conditions.

## Features

Minting Functionality: Users can mint tokens by paying a specified mintPrice in Ether.
Ownership Control: The contract owner can enable/disable minting and set maximum supply limits.
ERC721 Compliance: Inherits from OpenZeppelin's ERC721 implementation for NFT standards.
Access Control: Uses Ownable.sol for restricting certain functions to the contract owner.

## Usage
## Requirements
Ethereum Environment: Ensure access to an Ethereum-compatible environment (e.g., Remix, Truffle, Ganache).
Ether: Some functions may require payment in Ether (mintPrice).

## Deployment
Deploy the contract SimpleMint.sol using Solidity compiler (^0.8.0).
Ensure sufficient Ether for transaction fees and mintPrice.

## Functions
```toggleIsMintEnabled```: Toggles minting functionality on/off. Only callable by the contract owner.

```setMaxSupply```: Sets the maximum number of tokens (maxSupply). Only callable by the contract owner.

```mint```: Mints a new token to the caller's address if conditions (isMintEnabled, maxSupply, etc.) are met.
