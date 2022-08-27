## Challenge #3 - Truster

<br>

**Task:** More and more lending pools are offering flash loans. In this case, a new pool has launched that is offering flash loans of DVT tokens for free.

Currently the pool has 1 million DVT tokens in balance. And you have nothing.

But don't worry, you might be able to take them all from the pool. In a single transaction.

**Solution:**

Attacker's goal is to drain funds from receiver contract. I drained by calling `flashLoan()` **10** times.

<br>

```javascript
function flashLoan(address borrower, uint256borrowAmount)
```

<br>

**_How ?_**

<br>

We can pass any address to `flasLoan()`'s parameter named `borrower`. This means anyone execute `flashLoan()` on behalf of receiver. I called the `flashLoan()` **_ten_** times. It took me **_10_** transactions to do it.

To acheive this in one transaction I created a contract which calls the `flashLoan()` **_ten_** times and passes the receiver contract address to it.

<br>

**How to duplicate behaviour ?**

<br>

- _Clone this repository_

```bash
git clone https://github.com/ruwaifatahir/damn-vulnerable
```

- Go to the project directory

```
cd damn-vulnerable/NaiveReceiver
```

- _Install the dependencies_

```
npm install
```

- _Run Tests_

```
npx hardhat test
```
