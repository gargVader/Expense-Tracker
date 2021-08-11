import 'package:expense_tracker/models/Transaction.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final currDay = DateTime.now().subtract(Duration(days: index));

      double totalSumForCurrDay = 0;
      for (Transaction transaction in recentTransactions) {
        if (transaction.dateTime.year == currDay.year &&
            transaction.dateTime.month == currDay.month &&
            transaction.dateTime.day == currDay.day) {
          totalSumForCurrDay += transaction.amount;
        }
      }

      return {
        'day': DateFormat.E().format(currDay),
        'amount': totalSumForCurrDay
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  double getSpendingPcOfTotal(double amount, double maxSpending) {
    double ans;
    if (maxSpending == 0) ans = 0;
    ans = amount / maxSpending;
    print(ans);
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    data['day'],
                    data['amount'],
                    totalSpending == 0
                        ? 0
                        : (data['amount'] as double) / totalSpending),
              );
            }),
          ],
        ),
      ),
    );
  }
}
