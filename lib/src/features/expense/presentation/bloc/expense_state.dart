part of 'expense_bloc.dart';

enum ListStatus { loading, success, failure }
@immutable
class ExpenseState extends Equatable {
  final List<Expense> expenseList;
  const ExpenseState({this.expenseList = const[]});

  ExpenseState copyWith({List<Expense>? expenseList}){
    return ExpenseState(expenseList: expenseList ?? this.expenseList);
  }
  @override
  List<Object?> get props => [expenseList];
}

// final class ExpenseInitial extends ExpenseState {

//   @override
//   List<Object?> get props => [];
// }

// final class ExpenseListState extends ExpenseState {

//   final List<Expense> expenseList;
//   ExpenseListState({required this.expenseList});
//   @override
//   List<Object?> get props => [expenseList];
// }
