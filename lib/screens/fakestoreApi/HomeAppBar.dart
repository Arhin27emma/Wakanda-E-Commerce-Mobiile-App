// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'store_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppBar(
          leading: const Icon(Icons.grid_view_outlined),
          title: const Text("Wakanda Shop"),
          
        ),
      ),
    );
  }
}
