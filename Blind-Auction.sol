pragma solidity >=0.7.0 <0.9.0;

contract BlindAuction {

  // Variables
  struct Bid {
    bytes32 blindedBid;
    uint deposit;
  }


address payable public beneficiary;
uint public biddingEnd;
uint public revealEnd;
bool public ended;

mapping(address => Bid[]) public bids;

address public highestBidder;
uint public highestBid;

mapping(address => uint) pendingReturns;

  // Events
  event AuctionEnded(address winner, uint highestBid);

  // Modifiers
modifier onlyBefore(uint _time) { require(block.timestamp < _time); _; }
modifier onlyAfter(uint _time) { require(block.timestamp > _time); _; }


  // Functions

  constructor() {

  }

  function genereateBlindedBidBytes32() {

  }

  function bid() {

  }

  function reveal() {
    
  }

  function auctionEnd() {

  }

  function withdraw() {
  
  }
  
  function placeBid() {
  
  }

}
