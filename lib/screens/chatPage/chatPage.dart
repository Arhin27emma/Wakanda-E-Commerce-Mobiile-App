import 'package:app/screens/chatPage/messagePage.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});
  static String routeName = "/chatPage.dart";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text("Wakanda Chats", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
        actions: const[
          Icon(Icons.search, size: 30, color: Colors.white,)
        ],
        
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 1000,
              decoration: const BoxDecoration(
                color: Colors.black87,
              ),
              child: Column(
                children: [
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Messages", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(width: 40,),
                          Text("Users", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 40,),
                          Text("Status", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 40,),
                          Text("Groups", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 1000,
                    decoration: const BoxDecoration(
                    color:  Color.fromARGB(255, 245, 243, 252),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)), 
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 20),
                        child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Favorite Contacts", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            Text("...", style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, right: 20, left: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage("assets/images/shop1.png"),
                                  ),
                                  Text("Emma", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(width: 35,),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage("assets/images/shop2.png"),
                                  ),
                                  Text("Joana", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(width: 35,),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage("assets/images/shop3.png"),
                                  ),
                                  Text("Olivia", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                              SizedBox(width: 35,),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage: AssetImage("assets/images/catShoe1.png"),
                                  ),
                                  Text("Isaac", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1000,
                        height: 447,
                        decoration: const BoxDecoration(
                        color:  Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),    
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12, top: 12, bottom: 15, right: 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {Navigator.pushNamed(context, Messages.routeName);},
                                child: const ChatUsers()),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                              const SizedBox(height: 15,),
                              const ChatUsers(),
                            ],
                          ),
                        ),
                      ),
                )
                    ],
                  ),
                ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

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
                  Text("Isaac", style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),),
                  SizedBox(width: 175,),
                  Text("12:30", style: TextStyle(color: Colors.indigo, fontSize: 15,),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("This is a messag...", style: TextStyle(color: Colors.indigo, fontSize: 16),),
                  SizedBox(width: 100,),
                  CircleAvatar(
                    minRadius: 8,
                    backgroundColor: Color.fromARGB(255, 124, 216, 127),
                    child: Center(child: Text("1", style: TextStyle(color: Colors.white, fontSize: 18,),)),
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