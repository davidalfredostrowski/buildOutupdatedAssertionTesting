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
