import 'package:flutter/material.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/models/expense.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/screens/expenses/expenses_item.dart';


class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});
  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses found, start adding!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) {
                final expense = expenses[index];
                return Dismissible(
                  key: Key(expense.id),
                  onDismissed: (direction) => onExpenseRemoved(expense),
                  child: ExpenseItem(expense),
                );
              },
            ),
    );
  }
}
