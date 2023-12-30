// ignore_for_file: prefer_const_constructors
import 'package:app/screens/fakestoreApi/transHistory/transfirebase.dart';
import 'package:flutter/material.dart';

class HistoryTransaction extends StatefulWidget {
  const HistoryTransaction({super.key});
  static String routeName = "transactionScreen.dart";

  @override
  State<HistoryTransaction> createState() => _HistoryTransactionState();
}

class _HistoryTransactionState extends State<HistoryTransaction> {
  final FirebaseService firebaseService = FirebaseService();

  //List<TransactionModel> transaction = TransactionStorage.getTransactions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Transacton History",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)),
        ),
        body: FutureBuilder<List<TransactionModel>>(
        future: firebaseService.getTransactions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<TransactionModel> transactions = snapshot.data!;

            return ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                TransactionModel transactionModel = transactions[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order ID: ${transactionModel.id}',
                              style: TextStyle(color: Colors.indigo),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Amount: GHS ${transactionModel.amount}, \nEmail: ${transactionModel.email}',
                              style: TextStyle(color: Colors.indigo),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Status: ${transactionModel.status}',
                              style: TextStyle(color: Colors.green, fontSize: 15),
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
