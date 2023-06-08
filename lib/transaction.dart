class Transaction {
  final String id; // Unique identifier for the transaction
  final String title; // Title of the transaction
  final double amount; // Amount of the transaction
  final DateTime dateTime; // Date and time of the transaction

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.dateTime,
  });
}
