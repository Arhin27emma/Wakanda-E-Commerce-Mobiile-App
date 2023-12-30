// ignore_for_file: file_names, avoid_print

import 'package:app/bottomNav.dart';
import 'package:app/components/button.dart';
import 'package:app/global/common/toast.dart';
//import 'package:app/screens/fakestoreApi/transHistory/transModel.dart';
import 'package:app/screens/fakestoreApi/transHistory/transfirebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:uuid/uuid.dart';

class PayWindow extends StatefulWidget {
  const PayWindow({
    super.key,
  });
  static String routeName = "paymentWindow.dart";

  @override
  State<PayWindow> createState() => _PayWindowState();
}

class _PayWindowState extends State<PayWindow> {
  final FirebaseService firebaseService = FirebaseService();
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _emailController = TextEditingController();

  var publicKey = 'pk_test_03b1c494741114c3effd8fe2b6c79e4827f9c1f4';
  //'sk_test_8c4268dfc603ba2592f5383b395fadd83ea4bd37';

  var plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKey);
  }

  void makePayment() async {
  int price = int.parse(_amountController.text);
  Charge charge = Charge()
    ..amount = price
    ..reference = 'ref ${DateTime.now()}'
    ..email = _emailController.text
    ..currency = 'GHS';

  String generateTransactionId() {
    // ignore: prefer_const_constructors
    final uuid = Uuid();
    return uuid.v4();
  }

  try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: CheckoutMethod.card,
        charge: charge,
      );

      String transactionId = generateTransactionId();

      if (response.status == true) {
        TransactionModel transactionModel = TransactionModel(
          id: transactionId,
          amount: price,
          email: _emailController.text,
          status: 'success',
          //timestamp: DateTime.now().toString(),
        );

        await firebaseService.addTransaction(transactionModel);

      print('Transaction successful! Transaction ID: $transactionId');
      showToast(message: 'Transaction successful! Transaction ID: $transactionId');
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, BottomNavigation.routeName);
    } else {
      TransactionModel transactionModel = TransactionModel(
        id: transactionId,
        amount: price,
        email: _emailController.text,
        status: 'failed',
        //timestamp: DateTime.now().toString(),
      );

      await firebaseService.addTransaction(transactionModel);

      print('Transaction failed. Reason: ${response.message}');
      showToast(message: 'Transaction failed. Reason: ${response.message}');
    }
  } catch (e) {
    print('Error during transaction: $e');
    showToast(message: 'Error during transaction: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details", style: TextStyle(color: Colors.indigo, fontSize: 28, fontWeight: FontWeight.bold))
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea( 
            child: Form(
                key: _formKey,
                child: Column(children: [
                  const Text("Enter your order details to make final purchase of your product"),
                  const SizedBox(height: 30,),
                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Amount",
                        hintText: "eg: 10000",
                        //floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.money_rounded)),
                  ),
                  const SizedBox(height: 30,),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email address",
                        //floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.email_outlined)),
                  ),
                  const SizedBox(height: 30,),
                  DefaultButton(
                      text: 'Proceed to make payment', press: (){ makePayment(); _formKey.currentState!.reset();})
                ])),
          ),
      ),
    );
  }
}
