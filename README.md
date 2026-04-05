# ⛓️ evote-blockchain-dapps

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.19427226.svg)](https://doi.org/10.5281/zenodo.19427226)

## 📌 Project Overview
**evote-blockchain-dapps** is a research-driven decentralized application (dApp) for secure, transparent, and immutable digital voting. It demonstrates the use of **Ethereum-based Smart Contracts** to solve trust issues in administrative processes.

This project serves as a "Proof of Integrity" layer within the broader Sovereign Systems ecosystem.

---

## 🏗️ System Architecture (Blockchain Integration)

```mermaid
flowchart TD
    %% Global Styling
    classDef default fill:#f9f9f9,stroke:#333,stroke-width:1px,color:#333,font-family:Inter,sans-serif;
    classDef security fill:#e1f5fe,stroke:#01579b,stroke-width:2px;
    classDef blockchain fill:#fffde7,stroke:#fbc02d,stroke-width:2px;
    classDef logic fill:#f3e5f5,stroke:#7b1fa2,stroke-width:2px;
    classDef storage fill:#efebe9,stroke:#5d4037,stroke-width:2px;
    classDef governance fill:#fff3e0,stroke:#e65100,stroke-width:2px,stroke-dasharray: 5 5;

    %% Nodes & Structure
    User((👤 Voter / Auditor))
    
    subgraph APP_LAYER [Decentralized Application - dApp]
        direction LR
        WEB[Client Interface] --- API[Backend Service]
    end

    subgraph NETWORK [Sovereign Blockchain Network]
        direction TB
        NODE1[Validator Node A] --- NODE2[Validator Node B]
        SC{{Election.sol Smart Contract}}
    end

    subgraph STORAGE [Immutable State]
        VDB[(Blockchain Ledger)]
        EV[Event Logs]
    end

    subgraph AUDIT_SYNC [Cross-Domain Integration]
        PHX[Arize Phoenix AI Trace]
    end

    %% Connections
    User ==>|Sign Transaction| WEB
    WEB ==>|Web3 Call| SC
    API ==>|Watch Events| SC
    
    %% The Bridge: AI Governance to Blockchain
    PHX -.->|Anchor Hash| SC
    SC ==>|Commit State| VDB
    SC -.->|Emit Event| EV
    
    %% Assign Classes
    class User security;
    class WEB,API logic;
    class NODE1,NODE2,SC blockchain;
    class VDB,EV storage;
    class PHX governance;
```

### 📋 Diagram Legend (Blockchain Standards)
| Symbol/Style | Description | Classification |
| :--- | :--- | :--- |
| **Double Circle (( ))** | End User or External Auditor with Private Key | **Actor** |
| **Hexagon {{ }}** | Smart Contract (Solidity) Logic & Rules | **Smart Contract** |
| **Cylinder [( )]** | Immutable Ledger / Block Storage | **Distributed Store** |
| **Yellow Box** | Distributed Validator Network | **Consensus Layer** |
| **Purple Box** | dApp Business Logic & API Bridge | **Application Layer** |
| **Orange Box (Dashed)** | External AI Trace Data being "Anchored" | **Governance Bridge** |

---

## 🚀 Key Components & Logic

### 1. The Trust Layer: Smart Contracts (`Election.sol`)
All rules are hard-coded into Solidity.
- **Ownership:** Only the `owner` can start sessions or authorize voters.
- **Integrity:** Once a vote or an audit hash is submitted, the state is locked.
- **Transparency:** Anyone with network access can verify the results without trusting a central database.

### 2. The Bridge: AI-to-Blockchain Anchoring
This is the core of the "Sovereign Stack."
- When **OpenClaw** makes a decision, **Arize Phoenix** generates a unique `Trace ID`.
- This ID is hashed and sent to the Blockchain via a transaction.
- **Benefit:** You can prove *exactly* what the AI did at a specific timestamp by matching the Blockchain record with the local Phoenix logs.

### 3. Decentralized Identity (Voter Authorization)
Instead of a simple username/password, users are authorized via their **Public Address**. This ensures that only identity-verified nodes within the **Tailscale/Zero-Trust** network can interact with the ledger.

---

## 🛡️ Immutable Audit Workflow

1.  **Action:** A critical system change or a vote is initiated.
2.  **Validation:** The Smart Contract checks the `onlyOwner` or `pemilihTerotorisasi` status.
3.  **Consensus:** The validator nodes reach consensus on the transaction.
4.  **State Change:** The ledger is updated, and an `Event` is emitted.
5.  **Proof:** The user receives a transaction hash, which serves as a permanent, undeniable receipt of their action.

---

## 🛠️ Tech Stack Employed

| Layer | Technologies |
| :--- | :--- |
| **Blockchain** | ![](https://img.shields.io/badge/Solidity-363636?style=flat&logo=solidity&logoColor=white) ![](https://img.shields.io/badge/Ethereum-3C3C3D?style=flat&logo=ethereum&logoColor=white) ![](https://img.shields.io/badge/Truffle-5E464D?style=flat&logo=truffle&logoColor=white) |
| **Backend/Bridge** | ![](https://img.shields.io/badge/Node.js-339933?style=flat&logo=node.js&logoColor=white) ![](https://img.shields.io/badge/Knex.js-E16422?style=flat&logo=knex.js&logoColor=white) ![](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white) |
| **Security** | ![](https://img.shields.io/badge/Bcrypt-4F5D95?style=flat&logo=pypi&logoColor=white) ![](https://img.shields.io/badge/Dotenv-ECD53F?style=flat&logo=dotenv&logoColor=white) |
| **Infrastructure** | ![](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white) ![](https://img.shields.io/badge/Git-F05032?style=flat&logo=git&logoColor=white) |

---

## 🛠️ Simulation & Packages
Explore the automated smart contract builds and ABI distribution in the **NPM Packages** tab of this repository.

---
*Standardized by PES AI-Assistant (Gemini CLI)*
*Sovereign Systems Compliance v1.0*
