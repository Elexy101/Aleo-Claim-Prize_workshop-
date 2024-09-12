program aleo_claim_prize.aleo {
    // A bid in an auction.
    // - `owner`     : The address of the account that owns the record associated with this bid.
    //                 This is separate from the address of the account that placed the bid.
    // - `bidder`    : The address of the account that placed the bid.
    // - `amount`    : The amount of the bid.
    // - `is_winner` : Whether the bid is the winning bid.
    record Bid {
        owner: address,
        bidder: address,
        amount: u64,
        is_winner: bool,
    }

    record Claim_Prize {
        // owner address
        owner: address,
        // amount required to claim
        claim_amt: u64,
    }

    // Returns a new bid.
    // - `bidder` : The address of the account that placed the bid.
    // - `amount` : The amount of the bid.
    // Requires that `bidder` matches the function caller.
    // The owner of the record is set to the entity responsible for running the auction (auction runner).
    // The address of the auction runner is aleo1fxs9s0w97lmkwlcmgn0z3nuxufdee5yck9wqrs0umevp7qs0sg9q5xxxzh.
    transition place_bid(bidder: address, amount: u64) -> Bid {
        // Ensure the caller is the auction bidder.
        assert_eq(self.caller, bidder);
        // Return a new 'Bid' record for the auction bidder.
        return Bid {
            owner: aleo1az8p9vlllyqwtj0c2g9svkd0e5v0p3zzdflwwrpa7kpe8xrfxgfqqpru7m,
            bidder: bidder,
            amount: amount,
            is_winner: false,
        };
    }

    // Returns the winning bid.
    // - `first`  : The first bid.
    // - `second` : The second bid.
    // Requires that the function caller is the auction runner.
    // Assumes that the function is invoked only after the bidding period has ended.
    // In the event of a tie, the first bid is selected.
    transition resolve(first: Bid, second: Bid) -> Bid {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1az8p9vlllyqwtj0c2g9svkd0e5v0p3zzdflwwrpa7kpe8xrfxgfqqpru7m);
        // Resolve the winner of the auction.
        if (first.amount >= second.amount) {
            return first;
        } else {
            return second;
        }
    }

    // Returns ownership of the bid to bidder.
    // - `bid` : The winning bid.
    // Requires that the function caller is the auction runner.
    // Assumes that the function is invoked only after all bids have been resolved.
    transition finish(bid: Bid) -> (Bid, Claim_Prize) {
        // Ensure the caller is the auctioneer.
        assert_eq(self.caller, aleo1az8p9vlllyqwtj0c2g9svkd0e5v0p3zzdflwwrpa7kpe8xrfxgfqqpru7m);
        // Return 'is_winner' as 'true' in the winning 'Bid'.
        let winner_bid: Bid = Bid {
            owner: bid.bidder,
            bidder: bid.bidder,
            amount: bid.amount,
            is_winner: true,
        };
        let claim_token_to_winner: Claim_Prize = Claim_Prize {
            owner: bid.bidder,
            claim_amt: 5000u64, //awarded 5,000 token to bidder
        };

        //return outputs
        return (winner_bid, claim_token_to_winner);

    }

}

