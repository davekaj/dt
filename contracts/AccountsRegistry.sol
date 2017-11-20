pragma solidity ^0.4.18;

//i am going to write it where each new smart contract is a user account. that way you are in control of your shit. then have the main account

import './SafeMath.sol';
import './ownable.sol';
import './CreateAccount.sol';

contract AccountsRegistry is Ownable {

    using SafeMath for uint256;
     mapping (address => accountStorage) accounts;


    mapping (bytes32 => address) public usernames; // lookup user by username
    mapping (address => bytes32) public addresses; // lookup username by address
    mapping (address => address) public accountContracts; // lookup contract created by address 

    event LOG_NewAccountCreated (address indexed newContractAccount, address indexed owner, bytes32 name);
    

    function AccountsRegistry () {
        owner = msg.sender;

    }

    function createAccounts (bytes32 _name, bytes32 _description) public {
        require(usernames[_name] == address(0));
        require(addresses[msg.sender] == 0);
        require(accountContracts[msg.sender] == address(0));


        address newAccount = new CreateAccount(_name, _description, msg.sender);

        accountContracts[msg.sender] = newAccount;
        addresses[msg.sender] = _name;
        userNames[_name] = msg.sender;

        LOG_NewAccountCreated(newAccount, msg.sender, _name);
        
    }


}