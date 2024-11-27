import 'package:flutter/material.dart';
import 'package:test_flutter/W8/homework/models/expense.dart';
import 'package:test_flutter/W8/homework/screens/expenses/expense_list.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ExpenseScreen> {
   final List<Expense> _registerExpense = [
    Expense(
      title: 'Flight to Paris',
      amount: 450.00,
      expenseType: ExpenseType.TRAVEL,
    ),
    Expense(
      title: 'Concert tickets',
      amount: 150.00,
      expenseType: ExpenseType.LEISURE,
    ),
    Expense(
      title: 'Ronan The best Book',
      amount: 100.00,
      expenseType: ExpenseType.WORK,
    ),
    Expense(
      title: 'Dinner with friends',
      amount: 50.00,
      expenseType: ExpenseType.FOOD,
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense AppBar'),
        backgroundColor: Colors.blue,
      ),
      body: ExpensesList(expenses: _registerExpense),
      );
  }
}

