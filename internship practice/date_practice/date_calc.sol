//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./date_calc.sol";

contract A is DateTime{
    uint public currentTimestamp = block.timestamp;
    uint public updatedTimestamp = block.timestamp + 19800;
    uint public originalHours = currentTimestamp /60 / 60 %24;
    uint public actualHours = updatedTimestamp /60/60%24;
}
// 5 hours and 31 minutes  = 19860 seconds
//That is the estimated time when blockchain timestamps started from 1970
//So if I subtract it, I can get 0 hours and from there I should be able to calculate correct time!

//DUUUUUDEE!
//It is by UTC
//SO for India we have to do IST (+5:30)
//added by 19800 seconds, we get the perfect time!!!