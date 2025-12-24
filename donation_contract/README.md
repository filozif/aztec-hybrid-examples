# Aztec Private Donation Contract

A privacy-preserving donation portal built on Aztec L2.  
This project demonstrates a **hybrid state model** where donations are executed privately via ZK-proofs, while the total donated amount remains publicly verifiable.

The focus is on correctness of the privacy + public aggregate pattern rather than UI or token mechanics.

---

## Features

- **Private Donations** Donor identity and individual donation amounts are fully shielded.

- **Public Aggregate State** The total donated amount is stored and verifiable in public state.

- **Hybrid Execution Model** Private execution path → public state update.

- **Aztec Horizon Alignment** Inspired by the *Aztec Horizon – Anonymous Donation Portal PRD*, specifically the **private donation / public aggregate** design.

---

## Environment

Tested on **Aztec Sandbox**:
- **PXE version**: v2.1.9
- **Network**: Local sandbox (`aztec start --sandbox`)
- **Node.js**: >=20 (tested with v22)
- **Tooling**: `aztec`, `aztec-nargo`

---

## Contract
- **Contract Address**: `0x24ae1f422ba1a6ea24f794ea51ed351b59510b6d757ebc5a9c289d347c848630`
- **Artifact**: `./target/donation_contract-DonationContract.json`

---

## Build
```bash
aztec-nargo compile
```

---

## Usage Guide

### 1. Private Donation
Send a private donation. The donor identity and amount remain hidden, while the aggregate is updated.
```bash
aztec send donate_private \
  -u http://localhost:8080 \
  -ca 0x24ae1f422ba1a6ea24f794ea51ed351b59510b6d757ebc5a9c289d347c848630 \
  -c ./target/donation_contract-DonationContract.json \
  --args 500 \
  -sk <SENDER_SECRET_KEY>
```

### 2. Verify Public Aggregate State
Query the publicly verifiable total donation amount using simulation:
```bash
aztec simulate get_total_donations \
  -u http://localhost:8080 \
  -ca 0x24ae1f422ba1a6ea24f794ea51ed351b59510b6d757ebc5a9c289d347c848630 \
  -c ./target/donation_contract-DonationContract.json \
  -sk <ANY_VALID_SECRET_KEY>
```

**Example output:** `600n`

---

## Verified Results
- **Private donation executed**: 500n (Block 9)
- **Public aggregate increase verified**: +100n (Block 10)
- **Final simulated total**: 600n

This confirms correct **hybrid execution**: private path for individual donations and public state for global verification.

---

## Status
✅ Contract deployed  
✅ Private donation executed  
`✅ Public aggregate verified  

Ready for review.
