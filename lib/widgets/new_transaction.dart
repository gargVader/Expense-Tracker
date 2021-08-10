import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

/// State class has context, widget internally
class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitTransaction() {
    Navigator.of(context).pop();
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) return;
    widget.addNewTransaction(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: _submitTransaction,
            )
          ],
        ),
      ),
    );
  }
}
