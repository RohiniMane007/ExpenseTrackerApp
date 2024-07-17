import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:expence_tracker/src/features/expense/presentation/view/pages/update_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/database/database_helper.dart';
import '../../../../../core/styles/textstyle.dart';
import '../../../domain/models/models.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({required this.expenseList, super.key});
  final List<Expense> expenseList;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  DatabaseHelper dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ListView.separated(
        itemCount: widget.expenseList.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 5,
          );
        },
        itemBuilder: <Expense>(context, i) {
          return Container(
            margin: const EdgeInsets.only(right: 10, left: 10),
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(widget.expenseList[i].category!,
                        style: CustomTextStyle.titleTextStylet()),
                    Text(widget.expenseList[i].date!,
                        style: CustomTextStyle.subTextStyle())
                  ],
                ),
                Column(
                  children: [
                    Text(widget.expenseList[i].amount.toString(),
                        style: CustomTextStyle.titleTextStylet()),
                    SizedBox(
                      // padding: EdgeInsets.fromLTRB(20, 0, 20, 0),

                      width: 50,
                      child: Text(widget.expenseList[i].description!,
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyle.subTextStyle()),
                    )
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return BlocProvider(
                              create: (context) => ExpenseBloc(),
                              child:
                                  UpdateExpense(expense: widget.expenseList[i]),
                            );
                          }));
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () async {
                          BlocProvider.of<ExpenseBloc>(context).add(
                              ExpenseDeleteEvent(
                                  id: widget.expenseList[i].id!));
                        },
                        icon: const Icon(Icons.delete))
                  ],
                )
              ],
            ),
          );
        });
  }
}
