// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Escrow} from "../src/Escrow.sol";


contract EscrowTest is Test {

        // State Variables
    Escrow escrow;
  
    /// @notice Generating deterministic addresses
    address  buyer = makeAddr("buyer");
    address seller = makeAddr("seller");

    uint256 public constant STARTING_BUYER_AMOUNT = 2 ether;

    /** Functions */ 
    /// @notice setUp() function, that runs first
    function setUp() public {

        // Deploys contract as buyer first , before 
        vm.prank(buyer);

        // deploying a fresh instance of your Escrow contract inside the test. Deploys a new Escrow contract and pass seller into its constructor, as done on the Escrow main contract .”
        escrow = new Escrow(seller);

        // Funding buyer with Eth (gives ETH to that address)
        vm.deal(buyer, STARTING_BUYER_AMOUNT);

    }


    function testIfAmountHasBeenDepositedPass() public {
            // ARRANGE
        uint256  amount = 1 ether;
        // Simulating buyer calling deposit with ETH (makes the next call come from that address)
        vm.prank(buyer);

            // ACT (the specific test being tested)
        escrow.deposit{value: amount}();

            // ASSERT
        // amount stored 
        assertEq(escrow.s_amountDeposited(), amount, "amount not deposited yet"); 
        // Contract balance
        assertEq(address(escrow).balance, amount, "Insufficient balance, no funds");
        // Funded state - Enum state data
        assertEq(uint256(escrow.s_escrowState()), 1);
    }


    function testDepositIfInsufficientFundReverts() public {
          // ARRANGE
        // Simulating buyer calling deposit with ETH (makes the next call come from that address)
        vm.prank(buyer);

             // ACT / ASSERT
         // confirms failure ( Expect revert with exact error message)
        vm.expectRevert("Did not have Eth"); 
        escrow.deposit{value: 0}();       
    }

}