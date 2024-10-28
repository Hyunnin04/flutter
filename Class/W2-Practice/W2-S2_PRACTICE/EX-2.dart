class BankAccount {
    final String _name;
    final String _accountNumber;
    double _balance;
    final String _accountType;

BankAccount({ required String name, required String accountNumber, double Balance = 0.0, required String accountType,
  })  : _name = name,  _accountNumber = accountNumber, _balance = Balance, _accountType = accountType;

  double get balance => _balance;

  // method balance()
  double getBalance(){
    return _balance;
  }
   // Method to withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew: \$${amount}");
    } else {
      print("Withdrawal amount must be positive.");
    }
  }
  // Method to cradit money
  void credit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Added: \$${amount} to account");
    } else {
      print("cradit amount must be positive.");
    }
  }
  @override
  String toString() {
    return 'Account Holder: $_name\n'
           'Account Number: $_accountNumber\n'
           'Balance: \$${_balance}\n'
           'Account Type: $_accountType';
  }
}

class Bank {
  final String name; 
  final List<BankAccount> _accounts = []; // List to store all bank accounts

  Bank({required this.name});

  BankAccount createAccount(int accountId, String accountOwner) {
    for (var account in _accounts) {
       (account._accountNumber == accountId.toString());
    }
    var accountNumber = accountId.toString(); 
    var newAccount = BankAccount( name: accountOwner, accountNumber: accountNumber, accountType: 'Savings',
    );

    // Add the account to the list
    _accounts.add(newAccount);

    print("Account for ${newAccount._name} created with Account ID: $accountId");

    return newAccount; // Return the newly created account
  }
}
// void main() {

//   Bank myBank = Bank(name: "CADT Bank");
//   BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

//   print(ronanAccount.balance); // Balance: $0
//   ronanAccount.credit(100);
//   print(ronanAccount.balance); // Balance: $100
//   ronanAccount.withdraw(50);
//   print(ronanAccount.balance); // Balance: $50

//   try {
//     ronanAccount.withdraw(75); // This will throw an exception
//   } catch (e) {
//     print(e); // Output: Insufficient balance for withdrawal!
//   }

//   try {
//     myBank.createAccount(100, 'Honlgy'); // This will throw an exception
//   } catch (e) {
//     print(e); // Output: Account with ID 100 already exists!
//   }
// }



