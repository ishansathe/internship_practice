// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.7.2/token/ERC20/ERC20.sol";

contract BlDevIntern is ERC20 {
    constructor() ERC20("BlDevIntern", "BlDI") {
        //Breaking this down, we initiated a constructor of this contract
        //and we also initiated the constructor of ERC20 contract! So the instance was created
        _mint(msg.sender, 10000 * 10 ** decimals());
        
        send10prcnt();
        //transfer(0x62aADA8f6F1d12F48e49db82D10A29B58dF95465, tenper);
    }

   
    mapping(address=>uint) public funded;
    
    /*   uint public ts = _totalSupply;  */
    //The real reason why this doesn't work is that the value to _totalSupply is assigned at run time
    //but the value we assign to ts is that of compile time which is at that time,  0
    //That is why the code is not working!!!!
    //We must find a way to access run time values.

    //We found a way! Just do everything inside the constructor lol.

    //We can call functions and variables that are defined/declared later in solidity!!
    //i.e we can call them to the constructor and THAT is beautiful.

    uint public tenper;
    event message(string);
    //Here, I did not mention the parameter name.
    //That is because even by mentioning type, the event is passing the argument 0
    //If we mention parameter, it passes 2 arguments 0 and <parameter_name> with same message
    //It is also possible to not have any argument at all!
    //However, in that case I would have had to declare and call multiple events an may have trouble tracking them.
    //It could also get annoying. (The above is because it simple triggers the event, and has no info inside.)

    uint public time = block.timestamp + 19800;
    uint private _hours = time /60/60%24;

    function send10prcnt () private returns (bool){
        
        require(_hours >= 5 && _hours <= 12, "function not called in morning");

        /*    tenper = totalSupply() / (10**(decimals()+1));    */
        //When we divide it by 10^18 that time we get original supply (which was 10000), to get 10% of that
        //we have to divide by 10^19 

        //However, we will supply 1000 of BlDI tokens which is actually 1000 * 10^18
        //So we simply have to divide by 10 to get 10 %


        tenper = totalSupply() / 10;
        emit message ("10 percent has been calculated");

        transfer(0x617F2E2fD72FD9D5503197092aC168c91465E7f2, tenper);
        emit message ("1000 tokens sent to specified address.");
        return true;
    }

    
   
}
