pragma solidity ^0.4.18;

//i am going to write it where each new smart contract is a user account. that way you are in control of your shit. then have the main account


contract SingleAccount {



    



    struct UserAccount {
        bytes32 userName;
        address owner;
        uint timeAccountCreated;
        uint blockNumber;
        bytes32 description;

    }


    bytes32[] public posts;
    address[] public followers;
    address[] public following;

    mapping (address => bool) public isFollowing;

    //uint public postNumber;
    //mapping (uint => posts) 
    UserAccount userInformation;

    //need to have this function only callable by the Registry
    function SingleAccount (bytes32 _name, bytes32 _description, address _owner) public {
        UserAccount memory ua = userInformation;
        ua.userName = _name;
        ua.owner = _owner;
        ua.timeAccountCreated = block.timestamp;
        ua.blockNumber = block.number;
        ua.description = _description;

        userInformation = ua;



    }

    function post () {

    }

    function follow (address _ethAddress, bytes32 _userName) {
        require(isFollowing[_ethAddress] == false);
        //require they are registered in AccountsRegistry
        //require they cant follow themselves
        //require this account acctually exists, but it should if it called here!
        isFollowing[_ethAddress] = true;
        following.push(_ethAddress);

    }

    function unfollow () {

    }

    function retweet () {

    }

    function like () {

    }

    function dislike () {

    }

    function respond () {

    }

    function updateDescription () {

    }

}


