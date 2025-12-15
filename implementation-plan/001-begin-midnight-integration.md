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
