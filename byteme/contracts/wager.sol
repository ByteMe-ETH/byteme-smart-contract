//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "./ethPrice.sol";

contract Wager is PriceConverter {
     
    address public winner;
    uint public minimumBetAmount=getConversion(260000000000000);
    uint gameCounter;


  
    struct Bet{
        address _owner;
        address _winner;
        uint256 amount;
        bool isTrue;
        uint gameID;
    }

    struct Game{
        address player1;
        address player2;
        uint256 gameID;
    }

    mapping(address=>Bet) public bets;
    mapping(address=>uint) public balances;
    mapping(uint=>address) public results;
    Game[] games;
    

    event betMade(address betMaker, Bet  bet);
    event paybackFinished(address _winner,uint gain);
    
    
    
    
    
    function makeBet(uint amount,address opponent,address guess) external returns(uint){
        require(amount>=minimumBetAmount,"Your bet is under the cap! ");
        Game memory game= Game(msg.sender,opponent,gameCounter);
        gameCounter++;
        games.push(game);
        bool _isTrue;
        if(winner==guess){
            _isTrue=true;
        }
        bets[msg.sender]=Bet(msg.sender,guess,amount,_isTrue,gameCounter);
        balances[msg.sender]+=amount;
        emit betMade(msg.sender,bets[msg.sender]);
        return game.gameID;
    }

    function payback() external{
        require(bets[msg.sender].isTrue,"It was NOT a successful bet !");
        uint gain= 2*(getConversion(bets[msg.sender].amount));
        balances[msg.sender]=gain;
        payable(msg.sender).transfer(gain);
        emit paybackFinished(msg.sender,gain);

    }

    receive() external payable{}
    fallback() external payable {
        revert();
    }
}