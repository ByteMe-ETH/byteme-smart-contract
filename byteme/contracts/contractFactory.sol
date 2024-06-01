// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import "./wager.sol";


contract FactoryContract {

    address[] public wagers;
    uint public wagercount;

    event wagerDeployed(address wager);
    
    function deployWager() public returns(address){
        Wager newWager= new Wager();
        wagers.push(address(newWager));
        wagercount++;
        emit wagerDeployed(address(newWager));
        return address(newWager);
   }




}