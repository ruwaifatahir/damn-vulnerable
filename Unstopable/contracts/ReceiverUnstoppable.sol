// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import {UnstoppableLender} from "./UnstoppableLender.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title ReceiverUnstoppable
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */
contract ReceiverUnstoppable {
    UnstoppableLender private immutable pool;
    address private immutable owner;

    constructor(address poolAddress) {
        pool = UnstoppableLender(poolAddress);
        owner = msg.sender;
    }

    // Pool will call this function during the flash loan

    //Called by: Pool
    //Calls: Token
    function receiveTokens(address tokenAddress, uint256 amount) external {
        require(msg.sender == address(pool), "Sender must be pool");
        // Return all tokens to the pool
        require(
            IERC20(tokenAddress).transfer(msg.sender, amount),
            "Transfer of tokens failed"
        );
    }
    
    //called by owner
    //calls pool
    function executeFlashLoan(uint256 amount) external {
        require(msg.sender == owner, "Only owner can execute flash loan");

        //msg.sender: owner


        pool.flashLoan(amount);
    }
}
                        //    token
// EOA -> receiver -> pool -> receiver -> token


//EOA -> executeFlashLoan() -> pool.flahLoan -> token.transfer(msg.sener) && receiver.receiveTokens() -> token.transfer(msg.sender)
