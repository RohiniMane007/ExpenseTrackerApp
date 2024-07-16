import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({required this.expenseList, super.key});
  final List<Expense> expenseList;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, i) {
      return Container(
        height: 20,
        width: MediaQuery.sizeOf(context).width,
        child: const Text("1"),
      );
    });
  }
}
