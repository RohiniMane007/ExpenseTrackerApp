import 'package:expence_tracker/src/core/styles/size.dart';
import 'package:expence_tracker/src/features/expense/domain/models/models.dart';
import 'package:expence_tracker/src/features/expense/presentation/view/expense_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/expense_bloc.dart';
import 'add_expense.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => _ExpencePageState();
}

class _ExpencePageState extends State<ExpensePage> {
  List<Expense> expenseList = [];
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ExpenseBloc>(context).add(ExpenseListEvent());
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense"),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        color: const Color.fromARGB(255, 174, 238, 176),
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.list),
                onPressed: () {
                  BlocProvider.of<ExpenseBloc>(context).add(ExpenseListEvent());
                },
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        color: Colors.white10,
        child: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, state) {
            if (state is ExpenseListState) {
              return ExpenseList(expenseList: state.expenseList);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return BlocProvider(
              create: (context) => ExpenseBloc(),
              child: const AddExpense(),
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
