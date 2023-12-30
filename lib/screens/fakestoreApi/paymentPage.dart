// ignore_for_file: file_names

import 'package:app/bottomNav.dart';
import 'package:app/components/button.dart';
//import 'package:app/paystack/pay.dart';
import 'package:app/screens/fakestoreApi/_credeitCardDetails.dart';
import 'package:app/screens/fakestoreApi/paymentWindow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
 

class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});
  static String routeName = '/paymentPage.dart';

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () { 
          Navigator.pushNamed(context, BottomNavigation.routeName);},
      );
    },
  ),
        title: const Text(
          "Payment Method", 
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.indigo),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                CreditCardWidget(
                  bankName: 'Roboto Incooperation',
                  glassmorphismConfig: Glassmorphism.defaultConfig(),
                  enableFloatingCard: true,
                  floatingConfig: const FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(),
                  ),
                  
                  cardNumber: listData[0].cardNumber, 
                  expiryDate: listData[0].expiryDate, 
                  cardHolderName: listData[0].cardHolderName, 
                  cvvCode: listData[0].cvvCode, 
                  showBackView: listData[0].showBackView, 
                  onCreditCardWidgetChange: (data) {
                    debugPrint('Branch Name: ${data.brandName}');
                  },
                  
                  backgroundImage: 'assets/images/card_bg.jpg',
                  //backgroundNetworkImage: 'https://www.transparentpng.com/thumb/credit-card/gaEUTn-black-credit-card-images-png.png',
                  labelValidThru: 'VALID\nTHRU',
                  obscureCardNumber: true,
                  obscureInitialCardNumber: false,
                  obscureCardCvv: true,
                  labelCardHolder: 'CARD HOLDER',
                  //cardType: CardType.mastercard,
                  isHolderNameVisible: true,
                  height: 200,
                  textStyle: const TextStyle(color: Colors.white, letterSpacing: 4),
                  width: MediaQuery.of(context).size.width,
                  isChipVisible: true,
                  isSwipeGestureEnabled: true,
                  animationDuration: const Duration(milliseconds: 1000),
                  frontCardBorder: Border.all(color: Colors.grey),
                  backCardBorder: Border.all(color: Colors.grey),
                  chipColor: Colors.red,
                  padding: 16,
                  /*
                  customCardTypeIcons: [
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard, 
                      cardImage: Image.asset(
                        'assets/images/mastercard.png',
                        height: 50,
                        width: 50,
                      ),
                    
                    ),
                  ],*/
                  
                ),
        
                //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [ 
                        
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Pay With CARD", 
                            style: TextStyle(
                              fontSize: 18, 
                              color: Colors.indigo
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 30)),
                        SvgPicture.asset(
                          'assets/images/paystack.svg',
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                  ),
                ),
        
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipped from ", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                      Text("Amazon", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Shipping Fee ", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                      Text("\$50", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal ", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                      Text("\$5000", style: TextStyle(fontSize: 18, color: Colors.indigo, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: DefaultButton(text: 'Contiue Payment', press: () => Navigator.pushNamed(context, PayWindow.routeName),),
                )
              ],
            ),
          ],
        ),
      )
    );
  }

}