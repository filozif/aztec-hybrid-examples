# Aztec Network: Hybrid State Examples

This repository contains two functional smart contracts demonstrating the **Private-to-Public state transition** model on the Aztec Network.

## Projects

1.  **[Private Voting](./voting_contract)**: Secret ballots with a public tally.
2.  **[Private Donation](./donation_contract)**: Anonymous donations with a transparent total pool.

## Core Concepts Demonstrated
- **Private Execution**: Using ZK-proofs to keep user data (votes/amounts) confidential.
- **Cross-Context Calls**: Transitioning from a private context to a public state update.
- **State Management**: Handling `Map` and `PublicMutable` variables in a privacy-preserving environment.

## Requirements
- Aztec Sandbox (`aztec start --sandbox`)
- Aztec CLI / Wallet
- Noir (Nargo)
