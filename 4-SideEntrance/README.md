## Challenge #4 - Side entrance

<br>

**Task:** A surprisingly simple lending pool allows anyone to deposit ETH, and withdraw it at any point in time.

This very simple lending pool has 1000 ETH in balance already, and is offering free flash loans using the deposited ETH to promote their system.

You must take all ETH from the lending pool.

**Solution:**

Attacker's goal is to drain funds from pool contract. I drained by taking flash loan and returning back but while returning I made the record of these funds in pool contract as mine.

<br>

<br>

**_How ?_**

<br>

We can implement `execute()` as we want. So I deposited back the borrow amount to the pool contract while taking loan using `deposit()` and took all the funds from contract.

<br>

**How to duplicate behaviour ?**

<br>

- _Clone this repository_

```bash
git clone https://github.com/ruwaifatahir/damn-vulnerable
```

- Go to the project directory

```
cd damn-vulnerable/SideEntrance
```

- _Install the dependencies_

```
npm install
```

- _Run Tests_

```
npx hardhat test
```
