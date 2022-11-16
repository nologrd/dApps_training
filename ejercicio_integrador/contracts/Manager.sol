// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./Ticket.sol";

contract Manager is Ownable {
  
  address private admin;
  Ticket[] public tickets;
  Ticket public aTicket;

  receive() external payable {}
  fallback() external payable {}
  
  constructor() payable {
    admin = address(this);
  }

  event TicketCreated(Ticket newTicket);

  modifier isTransferable(uint ticketId) {
    bool ticket = false;
    aTicket = new Ticket();
    for (uint i = 0; i < tickets.length; i++) {
      if(tickets[i].id == ticketId) {
        if(tickets[i].transferStatus == "Transferable") {
          ticket = true;
        }
      }
    }
    require(ticket, "Ticket is not transferable");
    _;
  }

  function createTicket(Ticket _newTicket) public {
    // TODO
    aTicket = _newTicket;
    tickets.push(aTicket);

    emit TicketCreated(_newTicket);
  }

  function showAllTickets() public view returns(Ticket[] memory) {
    return tickets;
  }

  function showTicketsByAddress(address _ticketsOwner) public view returns (Ticket[] memory) {
    // TODO
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
