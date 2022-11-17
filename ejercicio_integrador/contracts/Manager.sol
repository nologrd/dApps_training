// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Ticket.sol";

contract Manager is Ownable {
  
  address private admin;
  Ticket[] public tickets;
  Ticket[] public ticketsToOwner;
  Ticket public aTicket;

  receive() external payable {}
  fallback() external payable {}
  
  constructor() payable {
    admin = address(this);
  }

  event TicketCreated(Ticket newTicket);

  modifier isTransferable(uint ticketId) {
    // TODO
    _;
  }

  function createTicket(string memory _eventName, string memory _eventDate, uint _price, string memory _eventDescription, uint _eventType) public {
    aTicket = new Ticket(_eventName, _eventDate, _price, _eventDescription, Ticket.EventType(_eventType));
    tickets.push(aTicket);

    ticketsByAddress[msg.sender].push(aTicket);

    /* for (uint i = 0; i < tickets.length; i++) {
      if (tickets[i].owner() == msg.sender) {
        ticketsToOwner.push(tickets[i]);
      }
      ticketsByAddress[msg.sender] = ticketsToOwner;
      
    } */

    emit TicketCreated(aTicket);
  }

  function showAllTickets() public view returns(Ticket[] memory) {
    return tickets;
  }

  mapping(address => Ticket[]) ticketsByAddress;

  function showTicketsByAddress(address _ticketsOwner) public view returns (Ticket[] memory) {
    return ticketsByAddress[_ticketsOwner];
  }


  function transferTicket(uint _ticketId, address ) private onlyOwner isTransferable(_ticketId) {
  /* 
  * Permitiendo que el nuevo dueño envíe ethers a través de la 
  * plataforma y que el dueño anterior reciba esos ethers
  */


  }

  function changeTicketPrice() private onlyOwner {}
  
  function showStatistics() private {}

  function deleteTicket() public onlyOwner {}

}
