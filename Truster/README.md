## Challenge #3 - Truster

<br>

**Task:** More and more lending pools are offering flash loans. In this case, a new pool has launched that is offering flash loans of DVT tokens for free.

Currently the pool has 1 million DVT tokens in balance. And you have nothing.

But don't worry, you might be able to take them all from the pool. In a single transaction.

**Solution:**

Attacker's goal is to drain funds from receiver contract his account. I drained it by calling approve function from `flashLoan()` and passed its address owner and mine spender.

<br>

**_How ?_**

<br>

We can pass any address and any function signature to `flasLoan()`. It'll call it for us. So I sent DVT contract address as target and approve function selecter. I got the allowance, Now I can transfer all the allowance from pool contract to my account.

<br>

**How to duplicate behaviour ?**

<br>

- _Clone this repository_

```bash
git clone https://github.com/ruwaifatahir/damn-vulnerable
```

- Go to the project directory

```
cd damn-vulnerable/Truster
```

- _Install the dependencies_

```
npm install
```

- _Run Tests_

```
npx hardhat test
```
