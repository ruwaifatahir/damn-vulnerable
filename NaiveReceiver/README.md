## Challenge #2 - Naive receiver

<br>

**Task:** There's a lending pool offering quite expensive flash loans of Ether, which has 1000 ETH in balance.

You also see that a user has deployed a contract with 10 ETH in balance, capable of interacting with the lending pool and receiveing flash loans of ETH.

Drain all ETH funds from the user's contract. Doing it in a single transaction is a big plus ;)

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
