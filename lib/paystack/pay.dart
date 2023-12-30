// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:app/paystack/paystack.dart';
import 'package:app/paystack/paystack_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';


class PaystackPage extends StatefulWidget {
  const PaystackPage({
    super.key, required this.amount, required this.email, required this.reference,
    
  });

  final String amount;
  final String email;
  final String reference;

  @override
  State<PaystackPage> createState() => _PaystackPageState();
}

class _PaystackPageState extends State<PaystackPage> {


  Future<PaystackAuthResponse> createTransaction(Transaction transaction) async{

    const String url = 'https://api.paystack.co/transaction/initialize';
    final data = transaction.tojson();
    try {
      final response = await http.post(Uri.parse(url), headers: {
        'Authorization': 'Bearer sk_test_8c4268dfc603ba2592f5383b395fadd83ea4bd37',
        'content': 'application/json',
      }, body: jsonEncode(data));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return PaystackAuthResponse.fromJson(responseData['data']);
      }
      else{
        throw 'Payment unsuccessful';
      }
    } on Exception {
        throw 'Payment unsuccessful';
      }
  }

  Future<String> initializeTransaction() async{
    try {
      final price = double.parse(widget.amount);
      final transaction = Transaction(amount: (price*100).toString(), reference: widget.reference, currency: 'GHC', email: widget.email);
      final authResponse = await createTransaction(transaction);
      return authResponse.authorizationUrl;

    } catch (e) {
      
      return e.toString();
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: initializeTransaction(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final url = snapshot.data;
          
            return WebView(
              
              onWebViewCreated: (WebViewController webViewController) {webViewController;},
              backgroundColor: Colors.white,
              javascriptMode: JavascriptMode.unrestricted,
              onProgress: (int progress){},
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {},
                //Uri.parse(url!),
            );}
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
