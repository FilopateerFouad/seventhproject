import 'package:flutter/material.dart';
import 'package:seventhproject/footballscreen.dart';
import 'package:seventhproject/widgets/custom_text.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: SizedBox( width: 200, 
        height:200,
          child: MaterialButton(
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (cp) {
                  return const Footballscreen();
                }));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    "assets/images/football image.jpg",
                    width: 80,
                    height: 80,
                  ),
                  CustomText(
                      text: "Football",
                      isBold: true,
                      colours:0xFF000000,
                      fontSize: 30,
                      align: TextAlign.center)
                ],
              )),
        ),
      ),
    );
  }
}
