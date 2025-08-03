# 🧠 Token Curated Registry (TCR) – Clarity Smart Contract

This project implements a simple **Token Curated Registry (TCR)** on the Stacks Blockchain using the Clarity smart contract language. It allows users to stake tokens to add entries to a curated list and challenge them.

---

## 📁 Project Structure

tcr-registry/
│
├── contracts/
│ ├── tcr.clar # Main TCR contract
│ └── voting.clar # New voting/dispute system (Phase 2)
│
├── ui/
│ └── index.html # Placeholder frontend
│
├── tests/ # Clarinet test files (optional)
├── Clarinet.toml # Project configuration
└── README.md # Documentation

yaml
Copy
Edit

---

## ⚙️ Requirements

- [Clarinet CLI](https://docs.stacks.co/clarity/clarinet-cli/install)
- Node.js (for future UI or testing)
- Git (for version control)

---

## 🚀 Setup Instructions

1. **Clone the Project**
   ```bash
   git clone <your-repo-url>
   cd tcr-registry
Install Clarinet

bash
Copy
Edit
curl -sSfL https://get.tryclarinet.com | sh
Check Contracts

bash
Copy
Edit
clarinet check
(Optional) Run Tests

bash
Copy
Edit
clarinet test
🔐 Smart Contract Overview
✅ add-entry (entry principal)
Stakes 1 STX to add a new registry entry.

Rejects if already listed or balance is too low.

🧪 challenge-entry (entry principal)
Currently a stub. Placeholder for dispute voting.

🗑️ remove-entry (entry principal)
Removes entry from registry.

No stake refund logic yet (planned).

🔎 is-listed (entry principal)
Checks if an entry exists in the registry.

💰 get-stake (user principal)
Returns amount staked by a user.

🧩 Phase 2 Features
🐛 Bug fix: Prevents overwriting existing stake on repeat add-entry

🗑️ New Function: remove-entry allows deletion of registry entries

📄 New UI Page: Basic index.html added for interaction simulation

📜 New Contract: voting.clar contract for submitting votes on challenged entries

📂 Clarinet.toml updated to register multiple contracts

📦 Next Steps
Implement full voting and challenge resolution

Add slashing/rewarding based on voting outcome

Integrate Stacks.js frontend

Deploy to testnet
