# Token Curated Registry (TCR) – Clarity Smart Contract

This project implements a simple Token Curated Registry on the Stacks Blockchain using the Clarity smart contract language.

## 📁 Project Structure

tcr-registry/
│
├── contracts/
│ └── tcr.clar # Main smart contract file
├── tests/ # Clarinet test files (to be added)
├── Clarinet.toml # Clarinet project configuration
└── README.md # Documentation

markdown
Copy
Edit

## 🧰 Requirements

- [Clarinet](https://docs.stacks.co/clarity/clarinet-cli/install)
- Node.js (for tests)

## 🚀 Setup Instructions

1. Clone or create your project folder:
   ```bash
   git clone <your-repo-url>
   cd tcr-registry
Install Clarinet (if not installed):

bash
Copy
Edit
curl -sSfL https://get.tryclarinet.com | sh
Build the project:

bash
Copy
Edit
clarinet check
Run tests (after creating them):

bash
Copy
Edit
clarinet test
⚙️ Smart Contract Usage
add-entry (entry principal)
Stakes STX to register a new entry.

Fails if already listed or insufficient balance.

challenge-entry (entry principal)
Placeholder for challenge logic (voting/dispute system).

is-listed (entry principal)
Returns true/false if entry exists in the registry.

get-stake (user principal)
Reads stake amount of a user.

�� Next Steps
Add test coverage

Implement voting mechanism

Handle challenge resolution and stake slashing
