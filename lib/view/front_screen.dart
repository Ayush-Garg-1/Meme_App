import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/memelogo.png'),
          Container(
            margin: EdgeInsets.only(top: 30),
            child:  const Text("MEME APP",
              style: TextStyle(
                fontSize: 50,
                color: Colors.black,
                fontWeight:FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
