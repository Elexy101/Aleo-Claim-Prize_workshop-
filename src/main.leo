// This example demonstrates an example of a minting and transferring a token in Leo.
program aleo_prize.aleo {

    record Claim_Prize {
        // owner address
        owner: address,
        // amount required to claim
        claim_amt: u64,
    }

    // The `mint` function initializes a new record with the
    // specified number of tokens assigned to the specified receiver.
    transition claim(owner: address) -> Claim_Prize {
        //fixed mint
        let amount : u64 = 5000u64;
        return Claim_Prize {
            owner: owner,
            claim_amt: amount,
        };
    }

    // The `transfer` function sends the specified number of tokens
    // to the receiver from the provided token record.
    transition transfer(token: Claim_Prize, to: address, amount: u64) -> (Claim_Prize, Claim_Prize) {

        // Checks the given token record has sufficient balance.
        // This `sub` operation is safe, and the proof will fail
        // if an overflow occurs.
        // `difference` holds the change amount to be returned to sender.
        let difference: u64 = token.claim_amt - amount;

        // Produce a token record with the change amount for the sender.
        let remaining: Claim_Prize = Claim_Prize {
            owner: token.owner,
            claim_amt: difference,
        };

        // Produce a token record for the specified receiver.
        let transferred: Claim_Prize = Claim_Prize {
            owner: to,
            claim_amt: amount,
        };

        // Output the sender's change record and the receiver's record.
        return (remaining, transferred);
    }
}
