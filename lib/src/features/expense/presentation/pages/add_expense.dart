import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant.dart';
import '../../domain/models/models.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  String categoryValue = '';

  @override
  void dispose() {
    super.dispose();
    txtAmount.dispose();
    txtDescription.dispose();
    txtDate.dispose();
    categoryValue = '';
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Material(
      type: MaterialType.card,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: DropdownMenu<String>(
                  expandedInsets: const EdgeInsets.symmetric(),
                  label: const Text("Category"),
                  onSelected: (String? value) {
                    categoryValue = value!;
                  },
                  dropdownMenuEntries:
                      category.map<DropdownMenuEntry<String>>((String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ),
            ),
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
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  TextButton(
                    child: const Text("Add"),
                    onPressed: () async {
                      BlocProvider.of<ExpenseBloc>(context).add(ExpenseAddEvent(
                          expense: Expense(
                              category: categoryValue,
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
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );

    /*return SizedBox(
        width: 400,
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
      
    );*/
  }
}
