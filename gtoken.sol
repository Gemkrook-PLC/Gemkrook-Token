pragma solidity ^0.8.11;
contract gtoken {
    mapping(address => uint) public balances;
    mapping(address => mapping(address =>uint)) public allowance;

    uint public totalSupply = 100000000000 * 10 ** 18;
    string public name = "Gemkrook Token";
    string public symbol = "GeT";
    uint public decimal = 18;

    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);

    constructor(){
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns(uint){
        return[owner];
    }

    function transfer(address to, uint value) public returns(bool){
        require(balanceOf(msg.sender) >= value, 'Balance too Low');
        balances[to] += value;
        balances[msg.sender] -= value;

        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address sender, uint value) public returns(bool){
        allowance[msg.sender][spender] = value;

        emit(msg.sender, spender, uint value);
        return true;
    }

    function transferFrom(address from, address to, uint value) public returns(bool){
        require(balanceOf(from) >= value, 'Balance too Low');
        require(allowance[from][msg.sender] >= value, 'Allowance too Low');
        balances[to]+= value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return (true);
    }
}
