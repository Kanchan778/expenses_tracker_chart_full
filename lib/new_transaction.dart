import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void onSubmitPressed() {
    // Retrieve the entered title and amount
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // Check if the entered title is empty or amount is negative
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }

    // Call the addTx function to add the transaction
    widget.addTx(titleController.text, double.parse(amountController.text));

    // Close the bottom sheet modal
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => onSubmitPressed(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => onSubmitPressed(),
            ),
            ElevatedButton(
              onPressed: onSubmitPressed,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
