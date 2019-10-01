pragma solidity >=0.5.2 <0.6.0;

contract UsersContract{
    // se genera la entidad usuario (estructura)
    struct User{
        string name;
        string lastName;
    }

    event onUserJoin(address,string);

    // permite enlazar direcciones de etherium a usuarios
    mapping(address => User) private users; // trae el usuario
    mapping(address => bool) private joinedUsers; // verifica si el usuario esta registrado
    address[] total;

    //function ingresa un nuevo usuario
    function join(string memory name, string memory lastName) public {
        require(!userJoined(msg.sender),'Error!, El usuario ya esta registrado');
        User storage user = users[msg.sender];
        user.name = name;
        user.lastName = lastName;
        joinedUsers[msg.sender] = true; // setea al usuario como registrado
        total.push(msg.sender); // agrega el usuario al array total
        onUserJoin(msg.sender,string(abi.encodePacked(name," ",lastName)));
    }

    //function llama al usuario y con ayuda del mapeo lo devuelve
    function getAdress(address addr) public view returns(string memory,string memory) {
        require(userJoined(msg.sender),'Error!, El usuario no esta registrado');
        User memory user = users[addr];
        return (user.name,user.lastName);
    }
    //function llama al usuario y con ayuda del mapeo sabe si esta registrado
    function userJoined(address addr) private view returns(bool){
        return joinedUsers[addr];
    }

    // Devuelve el valor de elementos del array total ( cantidad de usuarios registrados )
    function totalUsers() public view returns(uint){
        return total.length;
    }
}