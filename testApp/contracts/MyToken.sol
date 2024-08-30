// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, ERC20Permit {
    constructor(uint256 initialSupply)
        ERC20("XHHToken", "XHH")
        ERC20Permit("XHHToken")
    {
        _mint(msg.sender, initialSupply);
    }
}

// contract MyToken is ERC20 {
//     constructor(uint256 initialSupply) ERC20("XHHToken", "XHH") {
//         _mint(msg.sender, initialSupply);
//     }
// }
