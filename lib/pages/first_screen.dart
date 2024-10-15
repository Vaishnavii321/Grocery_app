import 'package:flutter/material.dart';
import 'package:grocery_app/pages/login_page.dart';
import 'package:grocery_app/utils/colors.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColors,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),

            Image.asset("assets/fourth.png",
              height:300,
              width: 300,
            ),

            const SizedBox(height: 40),

            const Text('Fast Delivery at\n your doorstep',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            
            const SizedBox(height: 30),

            const Text('Home delivery and online reservation\n  system for restaurants & cafe', 
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 60),

            Container(
              width: double.infinity,
              height: 60,
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    )
                  );
                }, 
                child: const Text("Let's Explore",
                style: TextStyle(
                  fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
                )
                ),
              )
            )
          ],
        ),
      )
    );
  }
}