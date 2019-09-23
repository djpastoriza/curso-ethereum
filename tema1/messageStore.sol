pragma solidity >=0.4.22 <0.6.0;

import "./Ownable.sol";

// msg : objeto que esta en todo el contrato
// se inicializa el contrato
contract MessageStorage is Ownable{
    string private message;

// payable: significa que esta funcion requiere dinero para activarse
    function setMessage(string memory newMessage) public payable{
        require(msg.value == 3 ether,"El valor no es igual 3 ether");
        message = newMessage;
    }

// retorna el mensaje
// view es solo lectura y no modifica nada en el contrato
    function getMessage() public view returns(string memory){
        return message;
    }
// retorna el balance del contrato (dinero que tiene el contrato despues de haber sumado por las transacciones)
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
// retorna el balance del contrato pero expresado en ethers
    function getBalanceInEther() public view returns(uint){
        return getBalance() / 1e18;
    }

    function transfer(uint amount) public isOwner{
        require(address(this).balance >= amount,"el balance no puede ser menor a la cantidad");
        owner.transfer(amount);
    }

}