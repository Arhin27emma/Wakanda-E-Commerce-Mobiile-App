// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.grid_view_outlined),
            iconSize: 25,
            color: Colors.indigo,
          ),
          const Text(
            "Wakanda Shop",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo
            ),
          ),
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.notifications_active_outlined),
            iconSize: 25,
            color: Colors.indigo,
          ),
        ],
      ),
      

    );
  }
}