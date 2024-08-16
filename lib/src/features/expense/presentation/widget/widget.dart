import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/presentation/bloc/expense_bloc.dart';
import 'package:expence_tracker/src/features/expense/presentation/pages/update_expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant.dart';
import '../../../../core/styles/textstyle.dart';
import '../../data/expence_api.dart';
import '../../domain/models/models.dart';

class ShowExpense extends StatefulWidget {
  const ShowExpense({required this.expenseList, super.key});
  final List<Expense> expenseList;

  @override
  State<ShowExpense> createState() => _ShowExpenseState();
}

class _ShowExpenseState extends State<ShowExpense> {
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
          return Dismissible(
            key: Key(widget.expenseList[i].toString()),
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.delete),
            ),
            onDismissed: (direction) {
              BlocProvider.of<ExpenseBloc>(context)
                  .add(ExpenseDeleteEvent(id: widget.expenseList[i].id!));
              widget.expenseList.removeAt(i);

              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Deleted")));
            },
            child: Card(
              elevation: 3,
              color: Colors.teal,
              margin: const EdgeInsets.only(right: 10, left: 10),
              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   
                    Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 25,height: 25, child: Image.asset(iconList[widget.expenseList[i].category!]!)),
                            const SizedBox(width: 10,),
                            Text(widget.expenseList[i].category!,
                            style: CustomTextStyle.titleTextStyle()),
                          ],
                        ),
                        
                        Text(widget.expenseList[i].date!,
                            style: CustomTextStyle.subTextStyle())
                      ],
                    ),
                    Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(widget.expenseList[i].amount.toString(),
                            style: CustomTextStyle.titleTextStyle()),
                        SizedBox(
                         
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
                                return UpdateExpense(
                                    expense: widget.expenseList[i]);
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
              ),
            ),
          );
        });
  }
}
