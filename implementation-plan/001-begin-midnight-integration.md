# Midnight Integration - Initial Planning

## Questions for Development Direction

Please answer the following questions to help establish the development approach for integrating The Fruit Seller Tarot with Cardano's Midnight sidechain:

### 1. Application Scope
What specific functionality of The Fruit Seller Tarot will utilize Midnight? (e.g., NFT minting, user authentication, private data storage, tarot reading records, payment processing)

ANSWER: 

1. I want to make a QR code that people can scan with their phone, that creates a transaction that puts a token in theri wallet. On Cardano CIP-99 implements this feature, ans some wallets are CIP-99 compliant. I would like to do it on Midnight.

2. NFT minting on Midnight.

3. I have build a Tarot reading bot. It works though our Discord. Currently it is open for channel members to freely use. I want to make it gated (user authentication) for token holders. It would be nice to have our CIP-99 style generated token to act as an entry gate an offer a basic reasgin,. and then have our NFT series (not yet minted) to act as enhancements, allowing holders to access varous Taerto reading improvements.

4. Keeping a record of Tarot readings would be an interesting topic to explore for later discussion. 

### 2. Privacy Requirements
What data needs to remain private vs. public on the blockchain? What are the privacy expectations for users of The Fruit Seller Tarot?

ANSWER: 

We could build this infrastructure on Cardano, but then all holders have no privacy. It would be nice to have a set a features that users can choose to share. I want to explore this furuter, and consider aspects to integrate.

### 3. Development Environment
Do you have experience with TypeScript/JavaScript blockchain development? Are you familiar with Cardano development tools (Nami, eternl, etc.)?

ANSWER:

I am a proficent Cardano user, with several years of experience. I understand a full node, and CLI key pairs, seed phrase keys, and testnet/mainnet, and faucets. I feel quite experience with TypeScript development, and have used Claude Code to develop several projects deployed to things like Netlify and Supabase.

### 4. Smart Contract Complexity
Will you need custom smart contracts written in Compact (Midnight's language), or will you primarily use existing Midnight protocols and libraries?

ANSWER:

At this stage I don't knoe enough to answer this question, and I want to use this project to begin exploring the Midnight testnet, and the ecosysytem.

### 5. Integration Architecture
Will this be a standalone dApp, or does it need to integrate with existing web infrastructure? What's your preferred frontend framework (if any)?

ANSWER:

Currently, we are experimenting, and I have no other infrastructure to integrate with.

---

## Research Summary

Based on current Midnight blockchain status (as of late 2024):

- **Testnet**: Live since October 2024
- **Development Language**: Compact (TypeScript-based smart contract language)
- **Wallet**: Lace wallet (Midnight version available for Chrome)
- **Token**: NIGHT (24B fixed supply, minted on Cardano, mirrored to Midnight)
- **Mainnet**: Targeted for Q1-Q3 2026 in phases
- **TPS**: 5,000 transactions/second with sub-second block times (Jolteon consensus)

Key advantages for your use case:
- Privacy features via zero-knowledge cryptography
- TypeScript familiarity advantage for Compact development
- Partner chain to Cardano (SPOs can become Midnight validators)

## Next Phase Questions

### 6. Priority Feature
Which feature should we build first to learn Midnight fundamentals?
- A) QR code token distribution (CIP-99 style)
- B) Basic NFT minting
- C) Discord wallet authentication
- D) Simple token-gated access proof-of-concept
ANSWER:

Let's consider Discord wallet authentication

### 7. Testnet Setup
Are you ready to set up Midnight testnet access now? This involves:
- Installing Lace wallet (Midnight version)
- Obtaining testnet NIGHT tokens
- Setting up development environment with Compact SDK

ANSWER:

Let's start with setting up the CLI environment, wallet on testnet, accessing the faucet.

### 8. Discord Bot Integration
For the Discord bot authentication:
- Does your bot currently use any database for user data?
- Do you want wallet signature verification or token balance checking?
- Should the bot check balances on-demand or cache holder status?

ANSWER:

Currently we have Ollama 3.1 locally, and no database. I am not sure what I want. Guide me to complete something simple, that demonstrates the capability of Midnight.

### 9. Privacy Exploration
Which privacy features interest you most?
- A) Private token balances (holders invisible)
- B) Private transaction history
- C) Selective disclosure (users choose what to reveal)
- D) Private NFT ownership

ANSWER: I am not sure what I want. Guide me to complete something simple, that demonstrates the capability of Midnight.

### 10. Learning Path
Do you prefer to:
- A) Build minimal working examples for each feature sequentially
- B) Start with comprehensive documentation review before coding
- C) Clone/study existing Midnight example projects first

ANSWER: I am not sure what I want. Guide me to complete something simple, that demonstrates the capability of Midnight.
