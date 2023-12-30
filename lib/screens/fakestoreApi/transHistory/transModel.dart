class TransactionModel {
  final String id;
  final int amount;
  final String email;
  final String status;

  TransactionModel({required this.id, required this.amount, required this.email, required this.status});
}

class TransactionStorage{
  static List<TransactionModel> transactions = [];


  static void addTransaction(TransactionModel transactionModel){
    transactions.add(transactionModel);
  }

  static List<TransactionModel> getTransactions(){
    return transactions;
  }
}