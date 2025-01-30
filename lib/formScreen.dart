import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_account/provider/transactionProvider.dart';
import 'package:flutter_account/model/transaction.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Input"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(label: const Text("ชื่อรายการ")),
              autofocus: true,
            ),
            TextFormField(
              controller: _amountController,
              decoration: InputDecoration(label: const Text("จำนวนเงิน")),
              keyboardType: TextInputType.number,
            ),
            ListTile(
              title: Text("วันที่: ${_selectedDate.toLocal()}"),
              trailing: const Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newTransaction = Transaction(
                    title: _titleController.text,
                    amount: double.parse(_amountController.text),
                    date: _selectedDate,
                  );

                  Provider.of<TransactionProvider>(context, listen: false)
                      .addTransaction(newTransaction);

                  Navigator.pop(context);
                }
              },
              child: const Text("เพิ่มข้อมูล"),
            )
          ],
        ),
      ),
    );
  }
}