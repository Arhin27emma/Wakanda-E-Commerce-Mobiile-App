// ignore_for_file: file_names

import 'package:flutter/material.dart';


// ignore: camel_case_types
class productContainer extends StatelessWidget {
  const productContainer({
    super.key,
    required this.image,
    required this.text,
    required this.color,
    required this.description,
    required this.widths,
  });

  final String image;
  final String text;
  final String description;
  final Color color;
  final double widths;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 320,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(225, 222, 222, 1),
                    blurRadius: 0.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0))
              ],
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Column(
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(fontSize: 15),
                      ),
                      TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.black)),
                          child: const Text(
                            "Explore",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ))
                    ],
                  ),
                ),
                //Padding(
                //padding: const EdgeInsets.all(8),
                Image.asset(
                  image,
                  width: 129,
                ),
                //)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

