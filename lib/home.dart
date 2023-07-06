import 'package:flutter/material.dart';
import 'package:gallery/widgets/widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.white,
        // centerTitle: true,
        // leading: Icon(Icons.back_hand),
        title: BrandName(),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none
                ),
                )
                ),
                Icon(Icons.search)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
