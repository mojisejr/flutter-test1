import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//เราใช้ stateful widget เพราะว่าเราจต้องเปลี่ยนข้อมูลในนี้ หรือ ต้องมี action ต่างๆ ในนี้

class NewExpense extends StatefulWidget {
  NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //อันนี้จะนิยมใช้มากกว่าที่ comment ไว้ แล้วก็ มัน build in มาเลย เป็น controller
  //class สำหรับ input text แต่ต้องบอก flutter ให้ลบ controller ด้วย
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month - 1, now.day);

    //การ return เป็น future ก็คือ การที่เราจะต้องไปเขียน function เพื่อ รอรับ value ที่จะไปประมวลผลต่อ
    //ตอนที่ future ทำงานเสร็จแล้ว หรือ ก็คือ callback หรือ ก็คือ เหมือน async await ใน nodejs
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    // นั่นคือมันจะต้องรอก่อน จนกว่าด้านบนจะทำเสร็จ ถึงจะค่อยทำ ข้างล่างนี่ต่อ
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    //ตรงนี้แหละที่เอาไว้ ทิ้ง controller ก่อนที่ parent มันจะ dispose
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   //ตรงนี้จะสังเกตุว่าไม่มีการ set state เพราะว่าไม่ต้องการที่จะ rerender อะไรใน widget tree
  //   _enteredTitle = inputValue;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(label: Text("title")),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: "\$",
                  ),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No Date selected"
                          : DateFormat.yMd().format(_selectedDate!),
                    ),
                    IconButton(
                        onPressed: _presentDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                  items: Category.values
                      .map(
                        (cat) => DropdownMenuItem(
                          child: Text(cat.name),
                        ),
                      )
                      .toList(),
                  //ตรงนี้เราต้องแปลง map เป็น list ด้วย ToList
                  onChanged: (value) {}),
              TextButton(
                onPressed: () {
                  //pop context นี้ มันจะปิด modal
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: const Text("Save Expense"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
