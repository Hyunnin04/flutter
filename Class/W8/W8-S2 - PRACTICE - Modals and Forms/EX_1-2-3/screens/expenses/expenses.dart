import 'package:flutter/material.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/models/expense.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/screens/expenses/expenses_form.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/screens/expenses/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  Expense? _recentlyDeletedExpense; // To store the deleted expense temporarily
  int? _recentlyDeletedIndex; // To store the index of the deleted expense

  // Handles expense removal with undo functionality
  void onExpenseRemoved(Expense expense) {
    setState(() {
      // Save the index of the expense before removing it
      _recentlyDeletedIndex = _registeredExpenses.indexOf(expense);
      // Save the deleted expense
      _recentlyDeletedExpense = expense;
      // Remove the expense
      _registeredExpenses.remove(expense);
    });

    // Show SnackBar with Undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: _restoreDeletedExpense, // Restore the deleted expense
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // Restores the recently deleted expense
  void _restoreDeletedExpense() {
    if (_recentlyDeletedExpense != null && _recentlyDeletedIndex != null) {
      setState(() {
        // Reinsert the deleted expense at its original index
        _registeredExpenses.insert(_recentlyDeletedIndex!, _recentlyDeletedExpense!);
      });

      // Clear the temporary variables after restoring
      _recentlyDeletedExpense = null;
      _recentlyDeletedIndex = null;
    }
  }

  // Handles the creation of a new expense
  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  // Shows the modal bottom sheet to add a new expense
  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesList(
        expenses: _registeredExpenses,
        onExpenseRemoved: onExpenseRemoved,
      ),
    );
  }
}
