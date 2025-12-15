# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Instructions for Claude
Be succinct and use dot points in this chat. 
Research thoroughly before responding. 
Always and only provide credible, accurate information. 
If you don’t know, and cannot find out, simply say so. Do not guess. 

## Project Overview

This repository is dedicated to exploring the Midnight blockchain for The Fruit Seller Tarot project by the-old-tales. The project is in early development stages.

## Technology Stack

Based on the .gitignore configuration, this project is set up for:
- Node.js/JavaScript/TypeScript development
- Modern JavaScript frameworks (Next.js, Nuxt.js, Vite, or similar are anticipated)
- Environment-based configuration (.env files)

## Development Setup

### Initial Midnight Environment Setup

**Prerequisites**: Node.js 20+ required

```bash
# 1. Install Compact toolchain
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh

# 2. Source environment (or restart terminal)
source ~/.zshrc  # or ~/.bashrc

# 3. Verify compact CLI
compact --version  # Should show 0.3.0 or later

# 4. Install compiler (REQUIRED - fixes "No default compiler set" error)
compact list              # List available versions
compact update 0.26.0     # Install latest compiler

# 5. Create new Midnight app
npx create-mn-app <app-name>
cd <app-name>
npm run setup

# Development commands
npm run dev              # Start local Midnight node
npm run deploy:local     # Deploy to local network
npm run deploy:testnet   # Deploy to Midnight testnet
npm run test            # Run tests
npm run check-balance    # Check wallet balance
npm run cli             # Interactive CLI to test contract
npm run health-check    # Verify environment setup
```

### Project Structure (Once Created)

- `/contracts` - Compact smart contracts (TypeScript-based)
- `/api` - Backend services for contract interaction
- `/frontend` - dApp user interface (if applicable)
- `/.midnight` - Generated wallet and configuration

## Architecture Notes

### Midnight Integration Strategy

**Primary Use Cases**:
1. Token-gated Discord bot authentication
2. QR code token distribution (CIP-99 style on Midnight)
3. Private NFT minting and ownership
4. Privacy-preserving Tarot reading records

**Key Technology**:
- **Compact**: Smart contract language (TypeScript-based)
- **Midnight.js**: Client library for dApp development
- **Lace Wallet**: Midnight Preview version for testnet
- **Zero-Knowledge Proofs**: Built-in privacy features

**Authentication Pattern** (Discord Bot):
- Challenge-response flow using wallet signatures
- No database initially (in-memory sessions)
- Signature verification = authentication proof
- Token balance checking for access control

### Privacy Considerations

Midnight enables selective disclosure - users choose what to share. Key privacy features:
- Private token balances
- Private transaction history
- Private NFT ownership
- Public verification without revealing data

## Common Issues

**"No default compiler set" error**:
- Run `compact update 0.26.0` (or latest version from `compact list`)
- This installs the actual compiler needed for `npm run setup`

**"compact: command not found"**:
- Run `source ~/.zshrc` (or `~/.bashrc`)
- Or restart terminal after installation

**Docker warning during setup**:
- Docker required for proof server
- Non-critical for initial development/testing

## Resources

- **Official Docs**: https://docs.midnight.network
- **Testnet Faucet**: https://midnight.network/test-faucet
- **Developer Hub**: https://midnight.network/developer-hub
- **Setup Guide**: `/implementation-plan/002-testnet-setup-guide.md`
