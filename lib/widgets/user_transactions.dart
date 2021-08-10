import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 75.52, dateTime: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Shirt', amount: 45.33, dateTime: DateTime.now())
  ];

  void _addNewTransaction(String title, double amount) {
    if (title.isEmpty || amount <= 0) {
      return;
    }

    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());

    setState(() {
      _userTransaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
