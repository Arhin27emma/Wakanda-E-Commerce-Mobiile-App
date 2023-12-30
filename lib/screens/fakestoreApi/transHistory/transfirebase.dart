import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String id;
  final int amount;
  final String email;
  final String status;
  //final String timestamp;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.email,
    required this.status,
    //required this.timestamp, 
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'email': email,
      'status': status,
      //'timestamp': timestamp,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      amount: json['amount'],
      email: json['email'],
      status: json['status'],
      //timestamp: json['timestamp']
    );
  }
}
class FirebaseService {
  final CollectionReference _transactionsCollection =
      FirebaseFirestore.instance.collection('transactions');

  Future<void> addTransaction(TransactionModel transactionModel) async {
    await _transactionsCollection.doc(transactionModel.id).set({
      'amount': transactionModel.amount,
      'email': transactionModel.email,
      'status': transactionModel.status,
      //'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<List<TransactionModel>> getTransactions() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _transactionsCollection.get() as QuerySnapshot<Map<String, dynamic>>;

    return snapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data();
      return TransactionModel(
        id: doc.id,
        amount: data['amount'],
        email: data['email'],
        status: data['status'],
        //timestamp: data['timestamp'].toDate(),
      );
    }).toList();
  }
}
