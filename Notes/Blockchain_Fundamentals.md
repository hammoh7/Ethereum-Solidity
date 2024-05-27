# BLOCKCHAIN INTRODUCTION:

## What is Blockchain?
A blockchain is a distributed ledger that maintains a continuously growing list of ordered records, called “blocks”, that are linked together and secured using cryptography.
•	Blocks - Blocks are data containers where data is permanently recorded on blockchain. A block records Transactions,     
    Timestamps, Hash of previous block and Nonce.
•	Hash – Blockchain hash is digitized fingerprint of document or set of data. It ensures that the blocks content remain 
    unaltered.
•	Characteristics – Decentralization, Immutability and Transparency
•	Consensus mechanism – Proof of Work and Proof of Stake
•	Cryptography – Cryptographic hash functions, public-key cryptography and Digital signatures

### State Machines
A state machine is a behavior model that consists of finite number of states and therefore called as Finite State Machine (FSM). Based on current state and the given input, the machine performs state transitions and produces outputs.<br>
Working –
- 	Initial state – The blockchain starts in initial state. For ex, an empty ledger with no transactions.
- 	Transactions – Users send transactions to blockchain. Each transaction represents a change that should occur.
- 	State transition function – This is a set of rules that blockchain follows to update its state. When a new transaction is 
    processed, the state transition function determines how state changes.
- 	New state – After processing a transaction, the blockchain moves to new state, reflecting the changes made by transactions.
<br>
Problem of Double spending –
Double spending is the problem where the same digital asset (like a cryptocurrency) is spent more than once. This is a significant issue in digital currencies because digital information can be easily copied.<br>
Example:
-	Imagine Alice has 10 tokens. This is initial state of her account.
-	Alice tries to send 10 tokens to Bob and at same time tries to send the same 10 tokens to Charlie.
-	The state transition function needs to ensure that Alice cannot spend more tokens than she has.
<br>
Prevention – By processing the transactions in sequence and updating the state accordingly, the blockchain prevents Alice from spending the same 10 tokens twice.
<br>

**Key points:-**<br>
*Why is Block size limited in Blockchain?*<br>
- 	Smaller blocks can be efficiently distributed to all nodes, maintaining network speed and reducing risk of forks.
- 	If block size becomes too high, then the storage and bandwidth requirements might become too high for average users,    
    leading to centralization.
- 	Larger blocks can take long to validate, which can slow down the network.
- 	By limiting block size, the blockchain can prevent malicious actors from flooding the network with large numbers of 
    transactions.
<br>

*Block size limit?*
- 	For Bitcoin – 1-2 MB
- 	Ethereum – In Ethereum, instead of fixed block size, we use gas limit for each block. The gas limit is dynamic and can be 
    adjusted by network. As of now, the gas limit is around 15 million gas per block.
<br>

### Characteristics of Blockchain technology: -
- 	Decentralization - Blockchain operates on a peer-to-peer network where no single entity has control over the entire 
    network. Every participant (node) has a copy of the entire blockchain.
- 	Immutability - Once a block is added to the blockchain, it cannot be altered or deleted. This ensures the integrity and 
    trustworthiness of the data. This is due to use of cryptographic hash functions. Each block contains a cryptographic hash of the previous block, making it tamper-evident. Altering a block would require changing all subsequent blocks, which is computationally infeasible.
- 	Transparency – Transactions are recorded on a public ledger that anyone can view. This transparency ensures accountability 
    and trust.
- 	Security - Blockchain uses advanced cryptographic techniques to secure data and transactions. Each transaction is   
    encrypted and linked to the previous one.
- 	Consensus mechanisms - Nodes in the blockchain network agree on the validity of transactions and the state of the ledger 
    through consensus algorithms.
    - 	Proof of Work (PoW) - Used by Bitcoin, where miners solve complex mathematical puzzles to validate transactions. It 
        was initially used by Ethereum also. But in 2022, it transformed to Proof of Stake (PoS).
    -	Proof of Stake (PoS) - Used by Ethereum and other blockchains, where validators are chosen based on the number of 
        tokens they hold and are willing to 'stake' as collateral.
- 	Tokenization - Blockchain can represent real-world assets (like property, stocks) as digital tokens. These tokens can be 
    easily transferred, divided, and managed on the blockchain.
- 	Privacy - Users are represented by cryptographic addresses rather than personal information, providing a degree of privacy.

**Key points:-**<br>
*Mining - Mining in blockchain technology is the process through which new blocks are added to the blockchain. It involves* *solving complex mathematical puzzles to validate and secure transactions.*<br>
*Working of Mining –*
- 	Collecting transactions – Miners gather unconfirmed transactions from the network and organize them into a block.
- 	Hashing – Miners repeatedly run the block’s data through a cryptographic hash function. They change a small part of the 
    block’s data (called a nonce) each time until they find a hash that meets a certain condition. The process of finding valid hash is known as Proof of Work (PoW). Once a miner finds a valid hash, they broadcast the new block to the network.
- 	Verification – Other nodes in the network verify the validity of the new block and the solution to the puzzle. If valid, 
    the block is added to the blockchain, and the miner receives their reward.
- 	New Block – The new block is linked to the previous block, forming a chain of blocks.

*Nonce - A nonce (short for "number only used once") is a random or semi-random number that is used only once in* *cryptographic communication.*<br>
*In blockchain, a nonce is a number that miners adjust during the mining process to find a valid hash for a block.*
<br>

*How do miners know about the targeted hash they want to achieve. What are the criteria on which miner know that the block* *they have hashed is correct?*
-	Target hash - The target hash is a specific value that the hash of a new block must be less than or equal to for the block 
    to be considered valid. This target is set by the blockchain protocol and adjusts periodically.
-	Difficulty - The difficulty is a measure of how hard it is to find a hash. Higher the difficulty, smaller the target hash 
    value, making it harder to find valid hash


### Cryptography: -
Cryptography is the science of securing information by transforming it into a form that is unintelligible to anyone who does not possess the means to decipher it. It involves techniques such as encryption, decryption, hashing, and digital signatures to protect data from unauthorized access, ensure data integrity, and authenticate the identity of users and transactions.
- 	Securing transactions – Public-Key Cryptography (Asymmetric Encryption)
    -	Public and Private key – Each participant has public-private key pair. The public key shared openly, while private key 
        is kept secret.
    -	Digital Signatures - When a user initiates a transaction, it is signed with their private key. This signature can be 
        verified by anyone using the corresponding public key, ensuring the authenticity and integrity of the transaction.
 
- 	Ensuring Data Integrity – Hash functions
    -	Cryptographic Hashing - A hash function takes an input (or 'message') and returns a fixed-size string of bytes. The 
        output (hash) is unique to each unique input, and even a small change in the input drastically changes the hash.
    -	SHA-256 - Most commonly used hash function in Blockchain in Bitcoin.
    -	Merkle trees - A binary tree of hashes, used to efficiently and securely verify the integrity of large sets of data. 
        It ensures that any change in transaction data within a block is easily detectable.
    -	Immutability - In a blockchain, each block contains the hash of the previous block. This links the blocks together in 
        a chain. If any data in a block is altered, the hash will change, breaking the chain and making tampering evident.

-	Properties of Hash –
    -	Deterministic
    -	Fast computation
    -	Small changes in input produce different hashes (Avalanche effect)
    -	2 documents do not generate same hash (Collision resistant)
 
- 	Consensus Mechanisms –
    -	Proof of Work (PoW) - Miners solve complex mathematical puzzles based on cryptographic hash functions. The first miner 
        to solve the puzzle gets to add the new block to the blockchain and is rewarded with cryptocurrency.
    -	Proof of Stake (PoS) - Validators are chosen to create new blocks based on the number of tokens they hold and are   
        willing to "stake" as collateral.

*Example - https://andersbrownworth.com/blockchain/*

**Hash Collision**
A hash collision occurs when two distinct inputs produce the same hash output. Despite the vast number of possible hash values (e.g., 2256 for SHA-256), the finite size of the hash output means that collisions must exist (a principle known as the pigeonhole principle).
-   Collision Attacks – Birthday paradox:
    This paradox shows that the likelihood of a collision is higher than intuitively expected. For SHA-256, finding a collision via brute force would still require an infeasible amount of computational power, approximately 2128 operations.

-   Prevention –
    -	Strong hash function - Use hash functions with larger output sizes (like SHA-256, SHA-3) to reduce the probability of 
        collisions.
    -	Cryptographic best practices – Stay updated with latest research


**Key points:-**<br>
Blockchain technology can be both decentralized and distributed. 
- 	Distributed Ledger technology –
    Blockchain is the type of distributed ledger technology where ledger (database) is replicated and synchronized across multiple nodes in a network. Each node has a copy of entire blockchain
- 	Decentralization –
    -	No single point of control - In a public blockchain (like Bitcoin or Ethereum), no single entity controls the network. 
        Instead, network consensus is achieved through mechanisms like PoW or PoS.
    -	Peer-to-Peer network - Nodes in the network communicate directly with each other to validate and propagate 
        transactions and blocks.
-	Consensus protocols - Transactions are verified and added to the blockchain through collective agreement among nodes, 
    ensuring that the network operates without centralized oversight.


### Game Theory: -
Game theory is a mathematical framework used to analyze strategic interactions between individuals or entities, where the outcome for each participant depends on the actions of all. In blockchain technology, game theory plays a crucial role in designing mechanisms that incentivize participants to act in ways that maintain the network's security, integrity, and decentralization.<br>
Key concepts in Game Theory –
- 	Players - In blockchain, players include miners, validators, and users.
- 	Strategies - The actions or decisions available to each player. For example, a miner can choose to follow the protocol 
    honestly or attempt to attack the network.
- 	Payoffs - In blockchain, payoffs often involve transaction fees, block rewards, or penalties for malicious behavior.
- 	Equilibrium - A state where no player can improve their payoff by unilaterally changing their strategy. The most common 
    type is the Nash Equilibrium.
<br>
Game Theory problems –

- 	The Byzantine Generals Problem: 
    Imagine several generals of a Byzantine army camped around a city, who need to agree on a common battle plan to win. They are communicating through messages, which can be altered. Some generals may be traitors who want to destroy the plan.
    -   Problem - How can the loyal generals reach a consensus (agreement) despite the presence of traitors who might send    
        conflicting information?
        This problem is analogous to nodes in a blockchain network reaching consensus on the state of the blockchain, despite the potential presence of malicious nodes.
    -   Solution - Blockchain uses consensus algorithms like Proof of Work (PoW) or Proof of Stake (PoS) to solve this 
        problem, ensuring that the network can agree on a single version of the truth even if some nodes are acting maliciously.
- 	51% Attack:
    In a blockchain network, if an entity controls more than 50% of the network’s mining or validation power, it can potentially manipulate the blockchain.
    -   Problem - The attacker could double-spend coins or prevent other transactions from being confirmed.
    -   Solution - PoW and PoS make it economically and computationally challenging to gain control of 51% of the network, 
        thus deterring such attacks.
- 	Staking and Slashing:
    Validators in a PoS system stake their tokens as collateral to validate blocks. If they act dishonestly, they lose part of their stake (slashing).
    -   Problem - Ensuring validators act in the best interest of the network.
    -   Solution - Staking and slashing ensure that validators are financially motivated to act correctly, maintaining the  
        security and integrity of the blockchain.
- 	Sybil attack:
    An attacker creates many fake identities to gain disproportionate influence in a network.
    -   Problem - This can distort decision-making processes and lead to centralization of control.
    -   Solution - Proof of Work (PoW) and Proof of Stake (PoS) inherently limit the influence of fake identities because 
        acquiring the necessary computational power (in PoW) or stake (in PoS) for a significant attack is prohibitively expensive.
- 	Tragedy of Commons:
    In a shared-resource system, individuals acting in their own interest can deplete the resource, leading to collective harm.
    -   Problem - How to prevent overuse and ensure sustainable management of the resource.
    -   Solution - Transaction fees and gas limits (as in Ethereum) help regulate resource use, incentivizing users to use the 
        network efficiently and preventing spam.
- 	Prisoner’s Dilemma:
    Two prisoners are offered a deal: if one betrays the other, the betrayer goes free while the other gets a long sentence. If both betray, both get moderate sentences. If neither betrays, both get short sentences.
    -   Problem - The dilemma arises because each prisoner’s best strategy depends on the other's action, often leading to a 
        suboptimal outcome for both.
    -   Solution - Blockchain protocols are designed to align incentives such that cooperation (e.g., honestly mining and 
        validating transactions) is the most rewarding strategy.

**Key points:-**<br>
*How is the nonce calculated to get perfect hash for the block?*
Finding nonce in blockchain mining is a hit-and-trial process, and it relies heavily on computational power.<br>
Computational power –
- 	Initial setup - A miner starts with a block of transactions, a timestamp, the previous block’s hash, and an initial nonce 
    value (often starting at 0).
- 	Hash calculation - The miner inputs the block header (which includes the current nonce) into the hash function to 
    calculate the hash.<br>
    For ex: using SHA 256, hash = SHA-256(block header + nonce)
- 	Checking hash – The miner compares resulting hash against the target value.
    -	If hash <= target, the nonce is correct, and the block is successfully mined.
    -	If hash > target, the nonce is incorrect.
- 	Incrementing the Nonce - If the hash does not meet the target, the miner increments the nonce and recalculates the hash. 
    This process is repeated, often millions or billions of times, until a valid nonce is found.


### What is Web3: -
Web3 represents the next evolution of the internet, characterized by decentralized protocols and technologies, often involving blockchain and cryptocurrencies.
<br>
Web1 (Static web):
-	Static content - Web1 consisted mostly of static web pages, which were simple documents connected by hyperlinks.
-	Read-only - Users could view information but had limited ability to interact or contribute.
-	Decentralized servers - While Web1 had a decentralized server architecture, content creation and control were centralized.
-	Examples - Britannica Online, and personal home pages.

Web2 (Social Web):
-	Dynamic content - Web2 introduced dynamic web applications that allowed users to interact, create, and share content. 
    Websites could update content on-the-fly without reloading pages.
-	Read-Write - Users could create their own content through blogs, social media, and video platforms. Interactivity   
    increased dramatically.
-	Centralized platforms - Web2 is dominated by large, centralized platforms (e.g., Google, Facebook, Amazon) that control 
    user data and content distribution.
-	Examples - Facebook, YouTube, Twitter, Wikipedia, and Amazon.

Web3 (Decentralized web):
-	Decentralization - Web3 aims to reduce reliance on centralized platforms by using blockchain and peer-to-peer networks. 
    Control and decision-making are distributed among users rather than centralized entities.
-	Trustless and Permissionless - Transactions and interactions on Web3 can occur without the need for a trusted 
    intermediary. Anyone can participate without needing permission from a central authority.
-	Smart contracts - These self-executing contracts with the terms of the agreement directly written into code run on 
    blockchain platforms (e.g., Ethereum), enabling decentralized applications (dApps).
-	Ownership and Control - Users have control over their data and digital assets, often using cryptographic keys. Data can be 
    stored in decentralized networks rather than on centralized servers.
-	Examples – Ethereum, Solana, Uniswap (DeFi), NFTs, DApps, Ether (ETH)


### Smart Contracts: -
Smart contracts are computer programs that automatically execute predefined actions when certain conditions are met. They are immutable and distributed, running exactly as programmed without any possibility of downtime, fraud, or third-party interference.
Benefits –
- 	Trustless transactions - Smart contracts remove the need for intermediaries, reducing the trust required between parties.
- 	Transparency – All transactions and contract terms are recorded on the blockchain, providing transparency and auditability.
- 	Efficiency – Automated execution reduces the time and cost associated with traditional contract enforcement and 
    administrative processes.
- 	Security – Smart contracts are stored on blockchain, making them resistant to tampering and fraud.
Common use cases –
- 	Financial services – Automated payments, insurance claims and loan agreements.
- 	Supply chain management – Tracking goods, verifying authenticity, and automating payments on delivery.
- 	Real estate – Automating property transfers and lease agreements.
- 	Voting system – Secure, transparent and tamper-proof voting mechanisms.
- 	Digital identity – Managing and verifying identities in decentralized manner.

Limitations of Smart contracts: -
- 	Immutability and Bugs –
    -	Once deployed, Cannot be changed - Smart contracts are immutable once deployed on the blockchain. If there is a bug in 
        the code, it cannot be easily fixed. This can lead to significant issues, as seen in high-profile incidents like the DAO hack.
- 	Complexity –
    -	Difficulty to Write and Audit - Writing smart contracts requires expertise in specific programming languages (e.g., 
        Solidity for Ethereum). Ensuring that the code is secure and free of bugs is challenging and requires thorough auditing.
- 	Scalability issues –
    -	Network congestion - High usage of blockchain networks can lead to congestion, increasing transaction times and costs. 
        This can affect the performance and efficiency of smart contracts.
- 	Cost –
    -	Gas fees - Executing smart contracts on blockchain platforms like Ethereum requires payment of gas fees. These fees 
        can be high, especially during periods of network congestion, making it costly to deploy and interact with smart contracts.
- 	Legal and Regulatory uncertainty –
    -	Legal recognition - The legal status of smart contracts is still uncertain in many jurisdictions. While some regions 
        recognize smart contracts as legally binding, others do not, which can create challenges for enforceability.
    -	Regulatory compliance - Smart contracts must comply with various laws and regulations, such as those related to 
        anti-money laundering (AML) and know your customer (KYC) requirements. Ensuring compliance can be complex.
- 	Oracles and External data –
    -	Dependence on Oracles - Smart contracts often need to interact with external data sources (oracles) to execute certain 
        conditions. Oracles are not inherently decentralized, which can introduce points of failure and trust issues.
    -	Data reliability - Ensuring the accuracy and reliability of data provided by oracles is critical, as incorrect data 
        can lead to undesired outcomes in the execution of smart contracts.
