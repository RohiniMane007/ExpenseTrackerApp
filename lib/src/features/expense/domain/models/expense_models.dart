class Expense {
  final int? id;
  final String? category;
  final String? amount;
  final String? date;
  final String? description;

  Expense({
    this.id,
    required this.category,
    required this.amount,
    required this.date,
    required this.description,
  });

  // Expense copy(
  //         {int? id,
  //         String? category,
  //         double? amount,
  //         String? date,
  //         String? descrption}) =>
  //     Expense(
  //       id: id ?? this.id,
  //       category: category ?? this.category,
  //       amount: amount ?? this.amount,
  //       date: date ?? this.date,
  //       descrption: descrption ?? this.descrption,
  //     );

  factory Expense.fromJson(Map<String, Object?> json) => Expense(
        id: json["id"] as int,
        category: json["category"] as String,
        amount: json["amount"].toString(),
        date: json["date"] as String,
        description: json["description"] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['category'] = category;
    data['amount'] = amount;
    data['date'] = date;
    data['description'] = description;

    return data;
  }
}
