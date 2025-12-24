# Aztec Network: Hybrid State Examples

This repository contains İwo functional smart contracts demonstrating the **Private-to-Public state transition** model on the Aztec Network.

## Projects

1. **[Private Voting](./voting_contract)**: Secret ballots with a public tally.
2. **[Private Donation](./donation_contract)**: Anonymous donations with a transparent total pool.

## Core Concepts
- **Private Execution**: Client-side ZK-proofs for user privacy.
- **Cross-Context Calls**: Securely bridging private actions to public state.
- **Horizon Pattern**: Minimal implementation inspired by Aztec Horizon architecture.

## Quickstart (Sandbox)

Ensure you have the [Aztec Sandbox](https://docs.aztec.network) running:
```bash
aztec start --sandbox
```

### Compile & Post-process
Navigate to either project and run:
```bash
aztec-nargo compile
aztec-postprocess-contract ./target/*.json
```

## Environment
- Tested with **Aztec Sandbox**
- Compiled using **Aztec-NR**
