import 'package:app/routes.dart';
import 'package:flutter/material.dart';
import './screens/splashScreen.dart';
import './theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Stripe.publishableKey = "pk_test_51OCRk4Jan662bCHAkXPWYcC6WtZndYjE8fD12D5dnMNXrCp9BJParIHuLDicEHmH2AtKbpdm2adrLliDFqIZcHcc008aaszCuD";
  runApp(const AppWidget());
}

// ignore: must_be_immutable
class AppWidget extends StatelessWidget {

  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: theme(),
      //home: SplashScreen(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

