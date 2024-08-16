import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expence_tracker/src/features/expense/data/expence_api.dart';
import 'package:flutter/material.dart';

// import '../../data/database_helper.dart';
import '../../domain/models/models.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {

    DatabaseHelper dbHelper = DatabaseHelper.instance;
  ExpenseBloc() : super(const ExpenseState()) {

    // ExpenseService expenseService;
    // on<ExpenseEvent>((event, emit) {});
    on<ExpenseListEvent>((event, emit) async {
      List<Map<String, dynamic>> res =
          await ExpenseService.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));
    });

    on<ExpenseAddEvent>((event, emit) async {
      await ExpenseService.insertItem(await dbHelper.database, event.expense);

      List<Map<String, dynamic>> res =
          await ExpenseService.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();
      
      emit(state.copyWith(expenseList: expenseList));
      
    });

    on<ExpenseUpdateEvent>((event, emit) async {
      await ExpenseService.updateItem(await dbHelper.database, event.expense);

      List<Map<String, dynamic>> res =
          await ExpenseService.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));

    });

    on<ExpenseDeleteEvent>((event, emit) async {
      await ExpenseService.deleteItem(await dbHelper.database, event.id);
      List<Map<String, dynamic>> res =
          await ExpenseService.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));

    });
  }
}
