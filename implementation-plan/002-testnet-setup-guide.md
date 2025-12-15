# Midnight Testnet Setup Guide

## Prerequisites

- **Node.js**: >= 20.x (install via NVM recommended)
- **OS**: Linux, macOS, or Windows WSL
- **Editor**: VS Code or similar
- **Experience**: Command-line proficiency (you have this ✓)

## Step 1: Environment Setup

### Install Node.js 20+ (if needed)
```bash
# Check current version
node --version

# If < 20.x, install via NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 20
nvm use 20
```

## Step 2: Create Your First Midnight App

### Quick Start with create-mn-app
```bash
# Install latest Compact toolchain
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh

# Source environment (or restart terminal)
source ~/.zshrc  # or ~/.bashrc if using bash

# Verify compact CLI installed
compact --version  # Should show compact 0.3.0 or later

# List available compiler versions
compact list

# Install latest compiler version (required for compilation)
compact update 0.26.0  # Or latest version from list

# Create new Midnight app (scaffolds with TypeScript, hot reloading, wallet generation)
npx create-mn-app tfst-midnight-auth

# Navigate to project
cd tfst-midnight-auth

# Run setup (installs dependencies, generates wallet)
npm run setup
```

This creates a preconfigured Midnight application with:
- TypeScript setup
- Hot reloading
- Wallet generation
- Example counter contract

## Step 3: Wallet Setup

### Install Lace Wallet (Midnight Preview)

1. Install Chrome extension: [Lace Wallet - Midnight Preview](https://chromewebstore.google.com/detail/lace-midnight-preview/)
2. Create new wallet:
   - Set wallet name (e.g., "Midnight Testnet")
   - **SAVE YOUR 24-WORD RECOVERY PHRASE SECURELY**
   - Set strong password
3. Switch to Midnight Testnet network (if not default)

### Alternative: CLI Wallet (Already Generated)

The `npm run setup` command generates a wallet in your project.
- Location: `.midnight/wallet` or similar
- Used for development and testing

## Step 4: Get Testnet Tokens

### Official Faucet

1. Visit: https://midnight.network/test-faucet
2. Connect your Lace Midnight Preview wallet
3. Request tDUST tokens (testnet DUST)
4. Wait for confirmation (usually seconds)

### Verify Balance

```bash
# If using CLI wallet (check project scripts)
npm run wallet:balance

# Or check in Lace wallet UI
```

## Step 5: Verify Setup

### Run the Counter Example

```bash
# Start local development environment
npm run dev

# In another terminal, deploy contract to local network
npm run deploy:local

# Test the contract
npm run test
```

Expected output:
- Local Midnight node running
- Counter contract deployed
- Transaction successful

## Step 6: Deploy to Testnet

```bash
# Deploy counter contract to Midnight testnet
npm run deploy:testnet

# This will:
# - Compile your Compact smart contract
# - Deploy to testnet
# - Return contract address
```

**Save the contract address** - you'll need it for Discord integration.

## Next Steps for Discord Authentication

After setup is complete, we'll build a simple Discord bot that:

1. **Challenge-Response Flow**:
   - User requests access in Discord
   - Bot sends a unique message to sign
   - User signs with Midnight wallet
   - Bot verifies signature
   - Grant access if valid

2. **Minimal Implementation**:
   - No database needed initially
   - In-memory session storage
   - Wallet signature = authentication proof

## Troubleshooting

### Common Issues

**"No default compiler set" Error**:
```bash
# List available compiler versions
compact list

# Install latest version (e.g., 0.26.0)
compact update 0.26.0

# Verify it's set as default
compact --version
```

**"compact: command not found"**:
```bash
# Source the environment file
source ~/.zshrc  # or ~/.bashrc

# If still not found, add to PATH manually
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

**NPM Package Access Failures**:
- Follow: https://docs.midnight.network/how-to/fix-package-repository-access-failures
- May need authentication for private @midnight-ntwrk packages

**Node Version**:
```bash
# Ensure using Node 20+
node --version
nvm use 20
```

**Wallet Connection**:
- Ensure Lace is on Midnight Testnet (not Cardano)
- Check browser extension permissions

## Key Packages for Discord Integration

```bash
# Wallet interaction
npm i @midnight-ntwrk/wallet

# Contract interaction
npm i @midnight-ntwrk/midnight-js-contracts

# dApp connector (for browser-based signing)
npm i @midnight-ntwrk/dapp-connector-api
```

## Resources

- **Official Docs**: https://docs.midnight.network/getting-started
- **Tutorial**: https://docs.midnight.network/develop/tutorial
- **Counter Example**: https://docs.midnight.network/develop/tutorial/building/counter-build
- **Developer Hub**: https://midnight.network/developer-hub
- **Forum**: https://forum.midnight.network/

---

## Status Checklist

Mark items as you complete them:

- [ ] Node.js 20+ installed
- [ ] Compact toolchain installed (`compact --version` works)
- [ ] Compiler version installed (`compact update 0.26.0`)
- [ ] Created app with `npx create-mn-app`
- [ ] Ran `npm run setup` successfully
- [ ] Installed Lace Midnight Preview wallet
- [ ] Generated/saved 24-word recovery phrase
- [ ] Obtained testnet tDUST from faucet
- [ ] Ran counter example locally
- [ ] Deployed contract to testnet
- [ ] Ready for Discord integration

---

**Next Document**: `003-discord-wallet-auth.md` (create after completing setup)
