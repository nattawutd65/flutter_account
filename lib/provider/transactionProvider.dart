import 'package:flutter_account/model/transaction.dart';
import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> transactions = [
    Transaction(title: 'CPU', amount: 10000, date: DateTime.now()),
    Transaction(title: 'GPU', amount: 25000, date: DateTime.now()),
    Transaction(title: 'RAM 32GB', amount: 5000, date: DateTime.now()),
    Transaction(title: 'SSD 1TB', amount: 5000, date: DateTime.now()),
    Transaction(title: 'Mainboard', amount: 7000, date: DateTime.now()),
    Transaction(title: 'Power Supply', amount: 3000, date: DateTime.now()),
    Transaction(title: 'Computer Case', amount: 2500, date: DateTime.now()),
    Transaction(title: 'CPU Cooler', amount: 2000, date: DateTime.now()),
  ];

  List<Transaction> getTransactions() {
    return transactions;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    notifyListeners();
  }
}
