// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Ticket {

  uint ticketsCounter = 0;

  uint public id;
  string public eventName;
  string public eventDate;
  uint public price;
  string public eventDescription;
  string public eventType;
  string public status;
  string public transferStatus;
  address public owner;

  constructor(
    string memory _eventName,
    string memory _eventDate,
    uint _price,
    string memory _eventDescription,
    string memory _eventType,
    string memory _status,
    string memory _transferStatus
  ) {
    id = generateId();
    eventName = _eventName;
    eventDate = _eventDate;
    price = _price;
    eventDescription = _eventDescription;
    eventType = _eventType;
    status = _status;
    transferStatus = _transferStatus;
    owner = msg.sender;
  }

  function changePrice(uint _ticketId) private {}
  
  function changeStatus(uint _ticketId) private {}

  function changeTransferStatus(uint _ticketId) private {}

  function changeOwner(uint _ticketId) private {}

  function generateId() public returns (uint) {
    uint _id = uint(keccak256(abi.encodePacked(ticketsCounter)));
    ticketsCounter++;
    return _id;
  }

  function showInformation(uint _ticketId) public returns (
    string memory,
    string memory,
    uint,
    string memory,
    string memory,
    string memory
    ) {
    
  }

}
