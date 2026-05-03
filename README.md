# Escrow Smart Contract
A secure and transparent escrow smart contract built with Solidity and Foundry, designed to facilitate safe transactions between buyers and sellers.

Design Patterns for the Escrow system in Blockchain
<img width="500" height="300" alt="escrow-trustless-lock-image" src="https://github.com/user-attachments/assets/4dd634a0-20ac-4679-b74d-247e5ba2320a" />

## Project Overview
This is a simple implementation of a escrow Ethereum smart contract that facilitates the following:
* A transaction between a buyer and a seller.
* The contract holds the funds in escrow (as a middle-man, programmatically) until the buyer approves the transaction, at which point the funds are released to the seller.
*  The escrow contract is intended to protect buyers and sellers of any physical or digital good or service from cheating each other.
*  The escrow contract , can only releaseFunds, when both "Buyer" and the "Seller" , agrees on one agreement

## 📌 Features
* ****Contructor(_seller):**** The seller would inoput he or her address first , which runs once immediately contract is deployed.
* ****Access Control:****  Access control for both the "Buyer" and "Seller" address are implemented, on the deposit() and refundBuyer() functions.
* ****Deposit Funds:****  The buyer deposits funds into the escrow. This transaction needs to be initiated by the buyer.
* ****Authorized Depositor:**** On the smart contract, only an authorized address can Deposit , which is to say only (authorized Buyer address) , not a Seller Address.
* ****Approve Transaction:**** The buyer  can approve the release of funds to the seller if they are satisfied with the transaction.
* ****Refund Transaction:****  The "seller" can also refund the funds back to the buyer in case of a dispute that is resolved in the buyer's favor.
* ****Escrow Functionality:**** The contract holds the funds sent by the "buyer" in escrow system(as the middle-man in a programmable format), until the seller approves the transaction, the buyer sees it and approve the sellers request and they both agree on one equal final words. Then after that is the point that the funds are released to the buyer through the Escrow System (internal by the contract itself).

## 🧠 Key Concepts Applied
* ****Data types:****  Defines the exact nature of data to be stored, ensuring the blockchain knows how to handle, compute, and store it efficiently(E.g address of both buyer and seller).
* ****Custom Error:**** Defined and used custom error as well, for gas optimation.
* ****Modifier:**** For Access-Control for both buyer and seller.
* ****Enum:**** Defined the lifecycle stages of the escrow contract (OPEN, FUNDED, COMPLETED, REFUNDED).
* ****Visibility specifiers:**** Used Public and Internal visibility specifier. The "internal specifier" function is controlled by the escrow(middleman programmatically) itself. While the "public visibility specifier" function was used publicly for everyone to interact with.

## 📂 Project Structure (Files)
* ****`Escrow.sol`:**** Core contract implementing deposit , approve , _releaseFund and refundBuyer functions.
* ****`Escrow.t.sol`:****  Unit Test (suite) containing tests to validate contract functionalities for the escrow project.

## Technology Stack (Technologies Used)
* ****Solidity**** - The programming language for writing the Smart contracts.
* ****RemixIDE**** - Used it to write, and deploy the smart contract directly in the browser first. A fastest way to get started, acting as a "no-setup" workshop for smart contract development.
* ****Foundry(forge, cast, anvil)**** -

## Getting Started

## Usage

## 📋Contract Details
### Functions:
* ****`deposit()`:**** A function, where the buyer deposit funds, to the smart contract  directly.
* ****``approve()`:**** A function , that checks If both parties "buyer" & "Seller" Approves (after agreeing on same terms).
* ****`_releaseFund()`:**** A function, that Automatically releases funds (the Escrow system), if both parties "buyer" & "Seller" Approves. Only done programmatically by the escrow system itself. 

### Variables:

## Usage Guide (How it works)
1. ****Compile:**** Compile the contract.
2. ****Deployment:****  Deploy the Contract. Set the addresses for the seller, before deployment.
3. ****Deposit:****  Buyer sends funds to the contract using the deposit function.
4. ****Approve:**** The buyer needs to approve the release of funds to the seller if they are satisfied with the transaction equally. Then the Escrow system (middle-man), will check if both are on thesame terms.
5. ****_releaseFund:**** The Escrow contract (internal function), automatically releases the funds, once both parties "buyer" and "seller" are on sam approval terms (✅). 
6. ****RefundBuyer:****  Depending on the transaction satisfaction, funds can be refunded to the buyer if it taking too long for the funds to be released by the seller(that is if the seller is yet to approve transaction) . Only the seller can release the funds back to the buyer , but you must make the function "****payable****" type if you want the  refundBuyer transaction to go through.

## Why This Matters (Voting Smart Contract)

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of (Some include):

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).

## Documentation

https://book.getfoundry.sh/

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```
