// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'expense_bloc.dart';

@immutable
sealed class ExpenseEvent {}

class ExpenseListEvent extends ExpenseEvent {
  ExpenseListEvent();
}

class ExpenseAddEvent extends ExpenseEvent {
  final Expense expense;
  ExpenseAddEvent({
    required this.expense,
  });
}

class ExpenseUpdateEvent extends ExpenseEvent {
  final Expense expense;
  ExpenseUpdateEvent({required this.expense});
}

class ExpenseDeleteEvent extends ExpenseEvent {
  final int id;
  ExpenseDeleteEvent({required this.id});
}
