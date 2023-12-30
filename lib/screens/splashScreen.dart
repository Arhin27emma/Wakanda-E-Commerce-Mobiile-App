// ignore_for_file: file_names

import '../screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String routeName = "/splash";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome To Wakanda Online Shop",
      "image": "assets/images/splash8.png",
    },
    {
      "text": "Shop all your products here.",
      "image": "assets/images/shop1.png",
    },
    {
      "text": "We deliver fast to your door step",
      "image": "assets/images/splash3.png",
    }
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    //final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 228, 230, 245),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  itemCount: splashData.length,

                  onPageChanged: (index) => setState(() {
                    currentPage = index;
                  }),

                  itemBuilder: (context, index) => SplashContent(
                    text: splashData[index]["text"] ?? "",
                    image: splashData[index]["image"] ?? "",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    splashData.length, (index) => buildDot(index)
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              DefaultButton(
                press: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                text: 'Continue',
              ),
              const Padding(padding: EdgeInsets.all(20))
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: animationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.indigo : Colors.grey,
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }
  
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key, required this.text, required this.press,
  });
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(15)),
          backgroundColor: const MaterialStatePropertyAll(Colors.indigo)
        ),
        
        onPressed: press, 
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      )
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const Text(
          "WAKANDA",
          style: TextStyle(
            fontSize: 40,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text, style: const TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
        const SizedBox(
          height: 20,
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 400,
          child: Image.asset(
            image,
            height: 400,
            fit: BoxFit.cover,
          ),
        )
      ],
    );
  }
}
