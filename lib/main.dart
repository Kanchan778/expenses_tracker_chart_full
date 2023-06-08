// Importing necessary dependencies and files
import 'package:expenses_tracker/chart.dart';
import 'package:expenses_tracker/new_transaction.dart';
import 'package:expenses_tracker/user_transactions.dart';
import 'package:flutter/rendering.dart';

// Importing transaction model and Flutter framework
import './transaction.dart';
import 'package:flutter/material.dart';
import './transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Transaction> transactionList = [
    // Initial transaction list with dummy data
    Transaction(
        id: "1", title: "Recharge", amount: 100, dateTime: DateTime.now()),
    Transaction(id: '1', title: "Lunch", amount: 100, dateTime: DateTime.now()),
  ];

  List<Transaction> get recentTransaction {
    // Retrieve recent transactions within the last 7 days
    return transactionList.where((tx) {
        return tx.dateTime.isAfter
        (DateTime.now().subtract(
          Duration(days: 7),
          ),
        );
    }).toList();
  }

  void _addTransaction(String title, double amount) {
    // Add a new transaction to the list
    var transaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        dateTime: DateTime.now());
    setState(() {
      transactionList.add(transaction);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    // Open a bottom sheet modal to add a new transaction
    print("Hello");
    showModalBottomSheet(
      context: context,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expenses"),
          actions: <Widget>[
            IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            // Display the chart widget with recent transactions
            Chart(recentTransaction),
            //User_Transaction(),
            // Display the transaction list widget with all transactions
            TransactionList(transactionList),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
          onPressed: () => _startAddNewTransaction(context),
          child: Icon(Icons.add),
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
