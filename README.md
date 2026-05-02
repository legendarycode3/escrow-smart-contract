# Escrow Smart Contract
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

## 📂 Project Structure (Files)
* ****`Escrow.sol`:**** Core contract implementing deposit , approve , _releaseFund and refundBuyer functions.
* ****`Escrow.t.sol`:****  Unit Test (suite) containing tests to validate contract functionalities for the escrow project.

## Technology Stack (Technologies Used)

## Getting Started

## Usage

## 📋Contract Details

## Usage Guide (How it works)
1. ****Compile:**** Compile the contract.
2. ****Deployment:****  Deploy the Contract. Set the addresses for the seller, before deployment.

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
