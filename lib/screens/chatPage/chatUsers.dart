import 'package:flutter/material.dart';

class ChatUsers extends StatelessWidget {
  const ChatUsers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage("assets/images/catShoe1.png"),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Isaac",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 175,
                  ),
                  Text(
                    "12:30",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "This is a messag...",
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  CircleAvatar(
                    minRadius: 8,
                    backgroundColor: Color.fromARGB(255, 124, 216, 127),
                    child: Center(
                        child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
