import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

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
      title: "Bus",
      amount: 120.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "Cinema",
      amount: 99.0,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    //context ตัวนี้คือ metadata ที่มากับตัว state widget ที่จะบอกว่า ตัว widget อยู่ที่ตรงไหน ของ widget tree
    //คิดว่า น่าจะทำให้ render ตำแหน่งได้ถูก หรือหาได้เจอว่ามาจากไหน
    showModalBottomSheet(context: context, builder: (context) => NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Chart"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ExpenseList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
