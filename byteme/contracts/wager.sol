//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "./ethPrice.sol";

contract Wager is PriceConverter {
     
    address public winner;
    uint public minimumBetAmount=getConversion(260000000000000);

  
    struct Bet{
        address _owner;
        address _winner;
        uint256 amount;
        bool isTrue;
    }
    mapping(address=>Bet) public bets;
    mapping(address=>uint) public balances;
    constructor(address _winner) {
        winner=_winner;
    }

    function makeBet(uint amount,address guess) internal{
        bool _isTrue;
        if(winner==guess){
            _isTrue=true;
        }
        bets[msg.sender]=Bet(msg.sender,guess,amount,_isTrue);
        balances[msg.sender]+=amount;
    }

    function payback() external{
        require(bets[msg.sender].isTrue,"It was NOT a successful bet !");
        uint gain= getConversion(bets[msg.sender].amount);
        balances[msg.sender];
        payable(msg.sender).transfer(gain);

    }

    fallback() external {

    }
}