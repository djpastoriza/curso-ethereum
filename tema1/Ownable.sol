pragma solidity >=0.4.22 <0.6.0;

// se inicializa el contrato
// msg : objeto que esta en todo el contrato
contract Ownable{
    address payable internal owner;
// propietario del contrato (msg.sender)
    constructor() public{
        owner = msg.sender;
    }
// verifica que el propietario del contrato sea el que envie el mensaje ( la cuenta propietaria )
    modifier isOwner(){
        require(owner == msg.sender,"El sender no coincide");
        _;
    }

}

