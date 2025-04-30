# BitPredix

**BitPredix** is a decentralized, trustless Bitcoin price prediction market built on the Stacks blockchain (Layer 2 for Bitcoin). It enables users to stake STX tokens on whether the price of Bitcoin will rise or fall over a specified time period. Market outcomes are resolved by a trusted oracle, and rewards are automatically distributed on-chain.

## Features

- **Decentralized Prediction Market**: Fully on-chain market creation, prediction, resolution, and settlement.
- **Bitcoin-Pegged Security**: Built on Stacks, benefiting from Bitcoin’s security and finality.
- **Automatic Payouts**: Fair and trustless reward distribution after market resolution.
- **Transparent Fees**: Configurable platform fee with clear on-chain logic.
- **Oracle Integration**: Price resolution is based on input from a designated oracle address.

## Contract Overview

### Key Entities

- `markets`: Stores market metadata, including BTC start/end price, stake totals, and block timings.
- `user-predictions`: Tracks individual user stakes, prediction direction (`"up"` or `"down"`), and claim status.
- `oracle-address`: A principal address authorized to resolve market outcomes.
- `contract-owner`: Admin with privileges to configure the contract and withdraw platform fees.

### Core Functions

| Function | Description |
|---------|-------------|
| `create-market` | Allows the contract owner to initialize a new prediction market. |
| `make-prediction` | Users place a stake on a BTC price movement (`"up"` or `"down"`). |
| `resolve-market` | Oracle resolves the market by providing the final BTC price. |
| `claim-winnings` | Winning participants claim their STX rewards. |
| `set-*` | Administrative functions to update oracle, fees, and stake limits. |
| `withdraw-fees` | Allows the contract owner to withdraw accumulated platform fees. |

## 📦 Deployment Details

- **Language**: [Clarity](https://docs.stacks.co/write-smart-contracts/clarity-language)
- **Platform**: [Stacks Blockchain](https://www.stacks.co)
- **Minimum Stake**: 1 STX (modifiable)
- **Fee**: 2% of winning payouts (modifiable)

## Example Usage

### Create a Market

```lisp
(create-market u65000 u10000 u10500)
```

### Make a Prediction

```lisp
(make-prediction u0 "up" u2000000) ;; Stake 2 STX on BTC going up
```

### Resolve Market

```lisp
(resolve-market u0 u67000) ;; Oracle sets end price to 67,000
```

### Claim Winnings

```lisp
(claim-winnings u0)
```

## Access Control

- Only the `contract-owner` can:
  - Create markets
  - Update oracle address and config values
  - Withdraw collected fees
- Only the `oracle-address` can:
  - Resolve market outcomes

## Read-Only Functions

- `get-market`: View market details by ID.
- `get-user-prediction`: View a user's prediction in a market.
- `get-contract-balance`: Returns STX balance held by the contract.

## Error Handling

| Error Code | Description |
|------------|-------------|
| `u100` | Unauthorized (owner only) |
| `u101` | Not found (market or prediction) |
| `u102` | Invalid prediction or parameters |
| `u103` | Market closed |
| `u104` | Already claimed winnings |
| `u105` | Insufficient balance |
| `u106` | Invalid parameter input |

## Contributing

Contributions, feedback, and pull requests are welcome! Please open an issue or submit a PR with your improvement or fix.
