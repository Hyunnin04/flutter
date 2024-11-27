import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const Uuid uuid = Uuid();

enum ExpenseType {FOOD, TRAVEL, LEISURE, WORK}
class Expense {
  final String id;
  final String title;
  final double amount;
  ExpenseType expenseType;
  final DateTime date;

  Expense({required this.title, required this.amount, required this.expenseType, DateTime? date,}):id=uuid.v4(), date = date ?? DateTime.now();
  String get formattedAmount => amount.toStringAsFixed(2);
  String get formattedDate => DateFormat.yMd().format(date);

  }
