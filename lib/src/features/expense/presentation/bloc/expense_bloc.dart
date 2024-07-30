import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/database_helper.dart';
import '../../domain/models/models.dart';

part 'expense_event.dart';
part 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(const ExpenseState()) {
    DatabaseHelper dbHelper = DatabaseHelper.instance;
    // on<ExpenseEvent>((event, emit) {});
    on<ExpenseListEvent>((event, emit) async {
      List<Map<String, dynamic>> res =
          await dbHelper.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));
    });

    on<ExpenseAddEvent>((event, emit) async {
      await dbHelper.insertItem(await dbHelper.database, event.expense);

      List<Map<String, dynamic>> res =
          await dbHelper.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();
      
      emit(state.copyWith(expenseList: expenseList));
      
    });

    on<ExpenseUpdateEvent>((event, emit) async {
      await dbHelper.updateItem(await dbHelper.database, event.expense);

      List<Map<String, dynamic>> res =
          await dbHelper.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));

    });

    on<ExpenseDeleteEvent>((event, emit) async {
      await dbHelper.deleteItem(await dbHelper.database, event.id);
      List<Map<String, dynamic>> res =
          await dbHelper.getItems(await dbHelper.database);

      List<Expense> expenseList =
          res.map((item) => Expense.fromJson(item)).toList();

      emit(state.copyWith(expenseList: expenseList));

    });
  }
}
