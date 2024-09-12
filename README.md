# Aleo-Claim-Prize_workshop-
A simple leo contract program I built to claim a reward, reward is transferrable. Reward is in form of tokens

# DEPLOYMENT LINK
Deployment Link: [https://testnet.aleoscan.io/program?id=aleo_prize.aleo](https://testnet.aleoscan.io/program?id=aleo_claim_prize.aleo)

Deployment Transaction ID: at16vz8ganm0tn5jcg826f46nfszfp0088um0hlqwclga56hfjfrgzsgehn7x

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

# Transition Functions
`place_bid(bidder: address, amount: u64) -> Bid:`
- Allows a participant to place a bid.
- Ensures that the function caller is the same as the bidder.
- Creates and returns a new Bid record with the bid amount and an initial is_winner set to false.
- The owner of the Bid record is hardcoded to an auction runner's address.
  
`resolve(first: Bid, second: Bid) -> Bid:`
- Resolves the winner between two bids.
- Ensures that only the auction runner can call this function.
- Compares the amounts of the two bids. If the amounts are equal, the first bid wins.
- Returns the winning Bid.
  
`finish(bid: Bid) -> (Bid, Claim_Prize):`
- Marks the bid as the winning bid by setting is_winner to true.
- Awards the winning bidder 5,000 tokens through a Claim_Prize record.
- Returns both the updated winning Bid and the Claim_Prize record.

Logic:

- Bidders place their bids via place_bid.
- After the bidding period, the auction runner resolves the winner using resolve.
- The finish function finalizes the auction, returning ownership of the bid to the winning bidder and awarding the prize.
- The program implements basic auction functionality with the ability to place bids, resolve the winner, and award a prize to the winning bidder.

# SCREENSHOT

![Screenshot from 2024-09-12 05-41-53](https://github.com/user-attachments/assets/c1bbbe60-0f6f-491d-a7ab-9732b2332522)


# VIDEO
[Screencast from 07-09-2024 14:32:10.webm](https://github.com/user-attachments/assets/f6752038-8c92-4f0c-91a0-68bb85c76598)



