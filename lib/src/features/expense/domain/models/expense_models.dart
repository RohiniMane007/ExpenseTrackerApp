class Expense{
  final int id; 
  final String category; 
  final double amount; 
  final DateTime date;
  final String descrption; 

  Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.descrption,
  });
}