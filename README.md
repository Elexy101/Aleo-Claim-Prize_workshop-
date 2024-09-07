# Aleo-Claim-Prize_workshop-
A simple leo contract program I built to claim a reward, reward is transferrable. Reward is in form of tokens

# DEPLOYMENT LINK
Deployment Link: https://testnet.aleoscan.io/program?id=aleo_prize.aleo

# Claim_Prize Record Structure

The Claim_Prize record is a custom data structure that stores two key pieces of information:

`owner: address:` This is the Aleo address that owns the prize or token.

`claim_amt:` u64: This is the amount of the token that can be claimed or transferred. It is defined as an unsigned 64-bit integer (u64).

This record acts like a container that holds token information, including the owner and the balance (claim amount).

# claim Function (Minting Tokens)
The claim function is responsible for creating or "minting" a new Claim_Prize record. The minting process initializes a new record with a fixed amount of tokens (5,000 in this case) and assigns it to a specific owner's address.

Function Explanation:

Parameters:
`owner: address:` The address that will own the minted tokens.

Logic:
- It sets a fixed amount of 5,000 tokens (amount: u64 = 5000u64).
- It creates and returns a new Claim_Prize record with the given owner and the fixed claim amount.

# transfer Function (Transferring Tokens)
The transfer function allows a user to send a specified amount of tokens from one address to another. It takes an existing Claim_Prize record, calculates the new balances for both the sender and the receiver, and produces two new records: one for the sender (with the remaining balance) and one for the receiver (with the transferred amount).

Function Explanation:
Parameters:

`token: Claim_Prize:` The token record from which tokens will be sent (i.e., the sender's token).

`to: address:` The address of the recipient.

`amount: u64:` The number of tokens to be transferred.

Logic:

- It checks that the sender's token has a sufficient balance for the transfer by calculating the difference: difference = token.claim_amt - amount.
- If the balance is insufficient, the operation will fail due to overflow protection (sub ensures no negative results).
- It creates two new Claim_Prize records:

  `remaining:` This record is for the sender, containing the leftover balance (difference).
  `transferred:` This record is for the recipient, containing the amount of tokens they are receiving.
  
- It returns both the sender's new record (remaining) and the recipient's record (transferred).

# SCREENSHOT

![Screenshot from 2024-09-07 14-21-59](https://github.com/user-attachments/assets/bb9a9afb-7bd5-43f4-bf6a-6958837bc337)


# VIDEO
[Screencast from 07-09-2024 14:32:10.webm](https://github.com/user-attachments/assets/f6752038-8c92-4f0c-91a0-68bb85c76598)


