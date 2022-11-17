// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Ticket {

  uint ticketsCounter = 0;

  uint private id;
  string public eventName;
  string public eventDate;
  uint public price;
  string public eventDescription;
  EventType eventType;
  Status public status;
  TransferStatus transferStatus;
  address public owner;

  enum Status { VALID, USED, EXPIRED }
  Status constant defaultStatus = Status.VALID;

  enum TransferStatus {TRANSFERABLE, NON_TRANSFERABLE }
  TransferStatus constant defaultTransferStatus = TransferStatus.TRANSFERABLE;

  enum EventType {
    SPORTS,   // 0
    MUSIC,    // 1
    CINEMA    // 2
  }

  constructor(
    string memory _eventName,
    string memory _eventDate,
    uint _price,
    string memory _eventDescription,
    EventType _eventType
  ) {
    id = generateId();
    eventName = _eventName;
    eventDate = _eventDate;
    price = _price;
    eventDescription = _eventDescription;
    eventType = _eventType;
    status = defaultStatus;
    transferStatus = defaultTransferStatus;
    owner = msg.sender;
    ticketInfo[id] = InfoTicket(eventName, eventDate, price, eventDescription, eventType, status, transferStatus);
  }

  struct InfoTicket {
    string eventName;
    string eventDate;
    uint price;
    string eventDescription;
    EventType eventType;
    Status status;
    TransferStatus transferStatus;
  }

  mapping(uint => InfoTicket) ticketInfo;

  function generateId() public returns (uint) {
    uint _id = uint(keccak256(abi.encodePacked(ticketsCounter)));
    ticketsCounter++;
    return _id;
  }

  function changePrice(uint _ticketId) private {}
  
  function changeStatus(uint _ticketId) private {}

  function changeTransferStatus(uint _ticketId) private {}

  function changeOwner(uint _ticketId) private {}


  function showInformation(uint _ticketId) public view returns (InfoTicket memory) {
    return ticketInfo[_ticketId];
  }

}
