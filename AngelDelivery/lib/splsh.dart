import 'package:flutter/material.dart';

class splash extends StatelessWidget {
  const splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/4.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.centerLeft,
            height: 300,
            //  color: Colors.amber,
            child: Image.asset(
              "images/44.png",
              width: 300,
            ),
          ),
        ),
      ),
    );
  }
}
