import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        final amountFormatted = NumberFormat.currency(symbol: '\$', decimalDigits: 2).format(expense.amount);
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(expense.title),
            subtitle: Text(
              '$amountFormatted - ${expense.expenseType.toString().split('.').last}',            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getIconForExpenseType(expense.expenseType), // Place the expense type icon near the date
                  color: Colors.black54,
                  size: 30.0,
                ),
                const SizedBox(width: 10),
                Text(DateFormat.yMd().format(expense.date),
                style: const TextStyle(fontSize: 15.0),
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  IconData _getIconForExpenseType(ExpenseType type) {
    switch (type) {
      case ExpenseType.FOOD:
        return Icons.restaurant;
      case ExpenseType.TRAVEL:
        return Icons.airplanemode_active;
      case ExpenseType.LEISURE:
        return Icons.local_activity;
      case ExpenseType.WORK:
        return Icons.book;
      default:
        return Icons.more_horiz;
    }
  }
}
