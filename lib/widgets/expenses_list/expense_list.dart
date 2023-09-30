import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({
    super.key,
    required this.expenses,
  });

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    //list builder จะเอาไว้ใช้ในการสร้าง list ที่เราอาจจะยังไม่รู้ ขนาดตั้งแต่ตอนแรก
    //สรุปคือ ถ้าเกิดว่าจะสร้าง list ให้ใช้อันนี้แหละสร้าง
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
}
