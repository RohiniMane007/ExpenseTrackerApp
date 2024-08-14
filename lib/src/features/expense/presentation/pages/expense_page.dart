import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/domain/models/models.dart';
import 'package:expence_tracker/src/features/expense/presentation/expense_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/constant.dart';
import '../bloc/expense_bloc.dart';
import 'add_expense.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpencePageState();
}

class _ExpencePageState extends State<ExpensePage> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtDate = TextEditingController();
  String categoryValue = '';

  List<Expense> expenseList = [];

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ExpenseBloc>(context).add(ExpenseListEvent());
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      /*bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        color: const Color.fromARGB(255, 101, 39, 112),
        child: SizedBox(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.list,
                  color: Colors.white,
                ),
                onPressed: () {
                  BlocProvider.of<ExpenseBloc>(context).add(ExpenseListEvent());
                },
              ),
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),*/
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        // color: Colors.white10, 
        child: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, state) {
            return ShowExpense(expenseList: state.expenseList);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () async {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return BlocProvider.value(
          //     value: BlocProvider.of<ExpenseBloc>(context),
          //     child: const AddExpense(),
          //   );
          // }));

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddExpense();
          }));
          /* await showAdaptiveDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog.adaptive(
                  // title: Text("Successfully Added"),
                  content: SizedBox(
                    width: 400,
                    height: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownMenu<String>(
                              expandedInsets: const EdgeInsets.symmetric(),
                              label: const Text("Category"),
                              onSelected: (String? value) {
                                categoryValue =value!;
                              },
                              dropdownMenuEntries: category
                                  .map<DropdownMenuEntry<String>>(
                                      (String value) {
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
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: const Text("Cancel")),
                    TextButton(
                        onPressed: () async {
                          BlocProvider.of<ExpenseBloc>(context).add(
                              ExpenseAddEvent(
                                  expense: Expense(
                                      category: categoryValue,
                                      description: txtDescription.text,
                                      date: txtDate.text,
                                      amount: txtAmount.text)));

                          txtDescription.clear();
                          txtAmount.clear();
                          txtDate.clear();
                          categoryValue = '';
                          Navigator.of(context).pop();

                        },
                        child: const Text("Add"))
                  ],
                );
              });*/
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
