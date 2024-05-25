// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/

// Contract declaration
contract MyToken {

    // public variables here
    string public Token_Name = "Harsh"; 
    string public Token_Abbrv = "HRSH"; 
    uint256 public Total_Supply = 0; 
    // mapping variable here
    mapping(address => uint256) public balance; 

    // mint function
    function mintTokens(address _recipient, uint256 _amount) public  {
        require(_amount > 0, "Invalid amount"); 
        require(_recipient != address(0),"Invalid recipient address"); 

        Total_Supply += _amount; 
        balance[_recipient] += _amount; 
    }

    // burn function
    function burnTokens(address _from, uint256 _amount) public {
        require(_from != address(0), "Invalid address"); 
        require(_amount > 0, "Invalid amount"); 
        require(balance[_from] >= _amount, "Insufficient balance"); 

        Total_Supply -= _amount; 
        balance[_from] -= _amount; 
    }
}
