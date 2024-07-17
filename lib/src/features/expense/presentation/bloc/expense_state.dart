part of 'expense_bloc.dart';

@immutable
sealed class ExpenseState extends Equatable {
  // @override
  // List<Object?> get props => [];
}

final class ExpenseInitial extends ExpenseState {
  @override
  List<Object?> get props => [];
}

final class ExpenseListState extends ExpenseState {
  final List<Expense> expenseList;
  ExpenseListState({required this.expenseList});
  @override
  List<Object?> get props => [expenseList];
}
