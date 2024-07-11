pragma solidity ^0.8.0;

contract Gaming {
    /* Our Online gaming contract */
    address payable public  owner;
    bool online;

    uint public wins;    /* public didnt allow me any advantage */
    uint public losses;

    struct Player {
        uint wins;
        uint losses;
    }

    mapping (address => Player) public players;

    function getWins() external payable returns ( uint ) {
        return wins;
    }

    function getLosses() external payable returns ( uint ) {
        return losses;
   }


    function getLosses333() public payable returns ( uint ) {
        return losses;
    }

    constructor() public payable {
        owner = payable(msg.sender);
        online = true;
        wins = 0;
        losses = 0;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    event PlayerWon(address player, uint amount, uint mysteryNumber, uint displayedNumber);
    event PlayerLost(address player, uint amount, uint mysteryNumber, uint displayedNumber);
               
