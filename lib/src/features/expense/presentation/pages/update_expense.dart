import 'package:expence_tracker/src/core/styles/size.dart';
// import 'package:expence_tracker/src/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant.dart';
// import '../../domain/models/models.dart';

class UpdateExpense extends StatefulWidget {
  const UpdateExpense({super.key, required this.expense});
  final Map<String, dynamic> expense;
  // final Expense expense;

  @override
  State<UpdateExpense> createState() => _UpdateExpenseState();
}

class _UpdateExpenseState extends State<UpdateExpense> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  String categoryValue = '';

  @override
  void initState() {
    super.initState();
    print(widget.expense.toString());
    // txtAmount.text = widget.expense.amount!;
    // txtDescription.text = widget.expense.description!;
    // txtDate.text = widget.expense.date!;
    // categoryValue = widget.expense.category!;
  }

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
      // color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          // height: 400,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: DropdownMenu<String>(
                    initialSelection: categoryValue,
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
              Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      controller: txtDescription,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )),
              Flexible(
                fit: FlexFit.loose,
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: TextField(
                    controller: txtAmount,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    )),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                onPressed: () async {
                  // BlocProvider.of<ExpenseBloc>(context).add(ExpenseUpdateEvent(
                  //     expense: Expense(
                  //         id: widget.expense.id,
                  //         category: widget.expense.category,
                  //         description: txtDescription.text,
                  //         date: txtDate.text,
                  //         amount: txtAmount.text)));

                  String? res = await showAdaptiveDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          title: const Text("Successfully Updated"),
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
                child: const Text("Update"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
