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
               



    event GameFunded(address funder, uint amount);

    function mysteryNumber() private view returns (uint) {
        uint randomNumber = uint(blockhash(block.number-1))%10 + 1;
        return randomNumber;
    }

    function determineWinner(uint number, uint display, bool guess) public pure returns (bool) {
        if (guess == true) {
            if (number > display) {
                return true;
            }
            if (number < display) {
                return false;
            }
        } else if (guess == false) {
            if (number > display) {
           
              }
            if (number < display) {
                return true;
            }
        }
    }

    event RoundComplete(uint wager, uint playerNumber, uint mysteryNumber, bool guess, string result);
    function winOrLose(uint display, bool guess) external payable returns (bool, uint) {
    /* function winOrLose(uint display, bool guess, uint wager) external payable returns (bool, uint) { */
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, display, guess);
        Player storage player = players[msg.sender];
        if (isWinner == true) {
            /* Player won */
            player.wins += 1;
            wins += 1;







   event RoundComplete(uint wager, uint playerNumber, uint mysteryNumber, bool guess, string result);
    function winOrLose(uint display, bool guess) external payable returns (bool, uint) {
    /* function winOrLose(uint display, bool guess, uint wager) external payable returns (bool, uint) { */
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, display, guess);
        Player storage player = players[msg.sender];
        if (isWinner == true) {
            /* Player won */
            player.wins += 1;
            wins += 1;
            payable(msg.sender).transfer(msg.value * 2);
            /* msg.sender.transfer(wager * 2); */
            emit RoundComplete(msg.value, display, mysteryNumber_, guess, "won");
            return (true, mysteryNumber_);
        } else if (isWinner == false) {
            /* Player lost */
            player.losses += 1;
            losses += 1;
            emit RoundComplete(msg.value, display, mysteryNumber_, guess, "lost");
            return (false, mysteryNumber_);
        }
    }



   event RoundComplete4(uint wager, uint playerNumber, uint mysteryNumber, bool guess, string result);
    function winOrLose4(uint display, bool guess) external payable returns (bool, uint) {
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, display, guess);
        Player storage player = players[msg.sender];
        if (isWinner == true) {
            /* Player won */
            player.wins += 1;
            wins += 1;
            payable(msg.sender).transfer(msg.value * 2);
            emit RoundComplete(msg.value, display, mysteryNumber_, guess, "won");
            return (true, mysteryNumber_);
        } else if (isWinner == false) {
            /* Player lost */
            player.losses += 1;
            losses += 1;
            emit RoundComplete4(msg.value, display, mysteryNumber_, guess, "lost");
            return (false, mysteryNumber_);
        }
    }
  function winOrLose3(uint display, bool guess) external payable returns (bool, uint) {
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        bool isWinner = determineWinner(mysteryNumber_, display, guess);
        Player storage player = players[msg.sender];
        if (isWinner == true) {
            /* Player won */
            player.wins += 1;
            wins += 1;
            payable(msg.sender).transfer(msg.value * 2);
            emit RoundComplete(msg.value, display, mysteryNumber_, guess, "won");
            return (true, mysteryNumber_);
        } else if (isWinner == false) {
            /* Player lost */
            player.losses += 1;
            losses += 1;
            emit RoundComplete(msg.value, display, mysteryNumber_, guess, "lost");
            return (false, mysteryNumber_);
        }
    }
   function winOrLose2() external payable returns ( uint) {
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        return (mysteryNumber_);


     }


    function withdrawFunds() public isOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function fundGame() public isOwner payable {
        emit GameFunded(msg.sender, msg.value);
    }

//    fallback() external payable {
//    }

}
   function winOrLose2() external payable returns ( uint) {
        /* Use true for a higher guess, false for a lower guess */
        require(online == true, "The game is not online");
        require(msg.sender.balance > msg.value, "Insufficient funds");
        uint mysteryNumber_ = mysteryNumber();
        return (mysteryNumber_);


     }


    function withdrawFunds() public isOwner {
        payable(msg.sender).transfer(address(this).balance);
    }

    function fundGame() public isOwner payable {
        emit GameFunded(msg.sender, msg.value);
    }

//    fallback() external payable {
//    }

}



