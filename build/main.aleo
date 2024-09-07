program aleo_prize.aleo;

record Claim_Prize:
    owner as address.private;
    claim_amt as u64.private;


function claim:
    input r0 as address.private;
    cast r0 5000u64 into r1 as Claim_Prize.record;
    output r1 as Claim_Prize.record;


function transfer:
    input r0 as Claim_Prize.record;
    input r1 as address.private;
    input r2 as u64.private;
    sub r0.claim_amt r2 into r3;
    cast r0.owner r3 into r4 as Claim_Prize.record;
    cast r1 r2 into r5 as Claim_Prize.record;
    output r4 as Claim_Prize.record;
    output r5 as Claim_Prize.record;
