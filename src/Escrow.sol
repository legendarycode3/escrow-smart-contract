// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/**
 * @title   Escrow Smart Contract
 * @author  LegendaryCode
 * @notice  A middleman contract, that holds funds until two parties approve. A Smart Contract , acting as a middleman (escrow), ensures that funds are only released when both parties - a "buyer" and a "seller" agree that conditions has been met, removing the need for third party.
 */




contract Escrow {
       
        /** TYPE DECLARATION */
    /// @notice Defines the lifecycle stages of the escrow contract . The States that the escrow contract can be in: 
    enum EscrowState {
        OPEN,     // 0 - Initial state, waiting
        FUNDED,    // 1 -  Funds are in escrow
        COMPLETED,  // 2 -  Funds released to beneficiary
        REFUNDED    // 3 -  Funds returned to depositor
    }


        /** STATE VARIABLES */
    /// @notice The buyers address
    address public immutable i_buyer; 
    
    /// @notice The sellers address
    address  public  immutable i_seller;

    /// @notice To store the amount locked
    uint256 public   s_amountDeposited;

    /// @notice Boolean variable for "buyer" when Approved it showed be checked 
    bool public isBuyerApproved;

    /// @notice Boolean variable for "seller" when approved it showed be checked
    bool public isSellerApproved;

    EscrowState public s_escrowState; 

    /// @notice Will be used to check if already released the amount after approved by 2 parties (the buyer and seller)
    bool public isReleased;


        /** ERRORS (CUSTOM) */
    error Escrow__NotBuyer();   
    error Escrow__NotSeller(); 
    error Escrow__NotFunded();
    error Escrow__NotApprovedByBoth();
    error Escrow__AlreadyReleased();
    error Escrow__NotAuthorized();


        /** MODIFIERS */
    /// @notice Access control only for Buyer
    modifier onlyBuyer {
        if (msg.sender != i_buyer) {
            revert Escrow__NotBuyer();
        }
        _;
    }
    
    /// @notice Access control only for Seller
    modifier onlySeller {
        if (msg.sender != i_seller) {
            revert Escrow__NotSeller();
        } 
        _;
    }


        /** FUNCTIONS */

    /// @notice THe constructor() , This function runs only once when the contract is first deployed to the blockchain... Takes in address _seller, Ethereum address of the person selling an item or service & added "Payable", to allow the constructor to receivce Ether(at the moment the contract is created)... Sets the address for both the buyer and the seller . 
    constructor(address _seller)  {
        i_buyer = msg.sender;

        i_seller = _seller; //stores who is to receive the funds
        
        // //  stores the amount of money the buyer sent
         s_escrowState = EscrowState.OPEN;
    }


    /// @notice deposit() function, where the buyer deposit funds, to the smart contract address directly not to the seller. 
    function deposit() public payable onlyBuyer {
            //CHECKS
        // Deposit only when open the state
        require(s_escrowState == EscrowState.OPEN, "Not Open, Already funded");
        require(msg.value > 0, "No ETH Sent, InsufficientEthBalance");
            
            // EFFECT
        s_amountDeposited = msg.value;

        s_escrowState = EscrowState.FUNDED;
    }


    /// @notice function approve(), checks if it has been  funded
    function approve() public {
            // CHECKS
        // checks if Escrow is not funded yet, then revert . Else continue
        if (s_escrowState != EscrowState.FUNDED) revert Escrow__NotFunded();
        if (msg.sender != i_buyer && msg.sender != i_seller) {
            revert  Escrow__NotAuthorized();
        }

            // EFFECTS
        if (msg.sender == i_buyer) {
            isBuyerApproved = true;
        } 
        if (msg.sender == i_seller) {
            isSellerApproved = true;
        } 
        
          // INTERACTION (via internal function)
        // If both parties "buyer" & "Seller" Approves , then release funds(Escrow) => Called
        if (isBuyerApproved && isSellerApproved) {
            _releaseFund();
        }
    }


    /// @notice releaseFund() function, Automatically releases funds (Escrow), if both parties "buyer" & "Seller" Approves = true:
    function _releaseFund() internal {
            // 1.  CHECKS
        require(s_escrowState == EscrowState.FUNDED, "Not funded");

        if (!(isBuyerApproved && isSellerApproved)) {  // Using custom error to check if both parties has approved.
            revert Escrow__NotApprovedByBoth();
        }   
        if (isReleased) {
            revert Escrow__AlreadyReleased();
        }
                
            // 2. EFFECTS (Updating state)
         isReleased = true;
        s_escrowState = EscrowState.COMPLETED;

        uint256 payout = address(this).balance;
        require(payout > 0, "No funds");


            // 3. INTERACTIONS
        // Seller sends the amount then the middleman escrow) after the 2 parties conditions has been met 
        (bool success, ) = i_seller.call{value: payout}("");
        require(success, "Transfer failed");
        
    } 


    /// @notice function , if not released for long (that is if seller those not approve so the escrow check for both party ), then refund the buyer 
    function refundBuyer() public payable onlySeller {
        // CHECKS
        require(s_escrowState == EscrowState.FUNDED, "Not funded");

        // EFFECTS
        s_escrowState = EscrowState.REFUNDED;
        uint256 refund = address(this).balance;

            // INTERACT
        (bool success, ) = i_buyer.call{value: refund}("");
        require(success, "Refund failed");
    }

   
}