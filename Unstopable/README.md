## Challenge #1 - Unstoppable

<br>

**Task:** There's a lending pool with a million DVT tokens in balance, offering flash loans for free.
If only there was a way to attack and stop the pool from offering flash loans ... <br>
You start with 100 DVT tokens in balance.

**Solution:**

Attacker's only goal is to break the contract. I broke it by sending `DVT` Token to pool contract.

**_How ?_**

When I sent `DVT` Token directly to pool contract. Its variable named `poolBalance` doesn't gets update. If someone tries to call `flashLoan()`, transaction will be reverted on line no: `47` because `balanceBefore` will not be equal to balance of this contract.

<br>

**How to duplicate behaviour ?**

<br>

- _Clone this repository_

```bash
git clone https://github.com/ruwaifatahir/damn-vulnerable
```

- Go to the project folder

```
cd damn-vulnerable/Unstopable
```

- _Install the dependencies_

```
npm install
```

- _Run Tests_

```
npx hardhat test
```
