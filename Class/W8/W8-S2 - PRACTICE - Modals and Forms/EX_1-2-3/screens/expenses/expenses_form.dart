import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/W8/W8-S2%20-%20PRACTICE%20-%20Modals%20and%20Forms/EX_1-2-3/models/expense.dart';


class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid Input'),
        content: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  void onAdd() {
    double? amount = double.tryParse(_amountController.text);
    String title = _titleController.text.trim();

    bool isTitleValid = title.isNotEmpty;
    bool isAmountValid = amount != null && amount > 0;

    if (isTitleValid && isAmountValid) {
      Expense expense = Expense(
        title: title,
        amount: amount,
        date: _selectedDate ?? DateTime.now(),
        category: _selectedCategory ?? Category.food,
      );

      widget.onCreated(expense);
      Navigator.pop(context);
    } else {
      String errorMessage = !isTitleValid
          ? "The title cannot be empty."
          : "The amount shall be a positive number.";
      _showAlertDialog(errorMessage);
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final initialDate = _selectedDate ?? DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      setState(() {
        _selectedDate = newDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            controller: _amountController,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          const SizedBox(height: 10),
          DropdownButtonFormField<Category>(
            value: _selectedCategory,
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.toString().split('.').last),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Category',
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => _pickDate(context),
            child: InputDecorator(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : DateFormat.yMd().format(_selectedDate!),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
