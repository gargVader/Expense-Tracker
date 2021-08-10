import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Shoes', amount: 75.52, dateTime: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Shirt', amount: 45.33, dateTime: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.blue,
            child: Container(
              width: double.infinity,
              child: Text('Chart'),
            ),
            elevation: 5,
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
