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

  constructor(
    uint _biddingTime,
    uint _revealTime,
    address payable _beneficiary
  ){
    beneficiary = _beneficiary;
    biddingEnd = block.timestamp + _biddingTime;
    revealEnd = biddingEnd + _revealTime;
  }

  function genereateBlindedBidBytes32(uint value, bool fake) public view returns (bytes32) {
    return keccak256(abi.encodePacked(value, fake));
  }

  function bid(bytes32 _blindedBid) public payable onlyBefore(biddingEnd) {
    bids[msg.sender].push(Bid({
      blindedBid: _blindedBid,
      deposit: msg.value
    }));
  }

  function reveal() {
    
  }

  function auctionEnd() public payable onlyAfter(revealEnd) {
    require(!ended, "Auction still going on!");
    
  }

  function withdraw() public {
    uint amount = pendingReturns[msg.sender];
    if (amount > 0){
      pendingReturns[msg.sender] = 0;

      payable(msg.sender).transfer(amount);
    }
  }
  
  function placeBid() {
  
  }

}
