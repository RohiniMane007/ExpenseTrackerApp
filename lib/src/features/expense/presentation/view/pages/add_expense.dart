import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constant.dart';
import '../../../domain/models/models.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: SizeConfig.screenWidth,
        height: 400,
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: txtDescription,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  controller: txtAmount,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                  )),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: txtDate,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  prefixIcon: Icon(
                    Icons.calendar_month_sharp,
                    color: Color(0XFF01579b),
                  ),
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? picked = await dateTimePicker(context);
                  setState(() {
                    txtDate.text = picked.toString().split(' ')[0];
                  });
                },
              ),
            )),
            ElevatedButton(
                onPressed: () async {
                  BlocProvider.of<ExpenseBloc>(context).add(ExpenseAddEvent(
                      expense: Expense(
                          category: "food",
                          description: txtDescription.text,
                          date: txtDate.text,
                          amount: txtAmount.text)));

                  String? res = await showAdaptiveDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: const Text("Successfully Added"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop("ok");
                                },
                                child: const Text("OK"))
                          ],
                        );
                      });

                  if (res == 'ok') {
                    if (!context.mounted) return;
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Add"))
          ],
        ),
      ),
    );
  }
}
