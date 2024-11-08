import 'package:flutter/material.dart';
import 'package:seventhproject/homescreen.dart';
import 'package:seventhproject/widgets/custom_text.dart';

// ignore: must_be_immutable
class Createaccount extends StatelessWidget {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Createaccount({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.grey,
        child: Column(children: [
         Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
                child: CustomText(text: "Create a new account",align:TextAlign.center, isBold: true, colours: 0xFF000000, fontSize: 28,),)),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomText(text: "Username",align:TextAlign.center, isBold: true, colours: 0xFF000000, fontSize: 35,),
          ),
          TextFormField(
            controller: username,
            decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                labelText: "Username",
                hintText: "enter your username",
                suffixIcon: const Icon(Icons.email)),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomText(text: "Password",align:TextAlign.center, isBold: true, colours: 0xFF000000, fontSize: 35,)
          ),
          TextFormField(
              obscureText: true,
              controller: password,
              decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)),
                  labelText: "Password",
                  hintText: "enter your password",
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined))),
          Padding(
            padding: const EdgeInsets.only(top: 40.0, right: 15.0, bottom: 20),
            child: Center(
              child: MaterialButton(
                  onPressed: () {
                    if (username.text != "" && password.text !="") {
                      Navigator.of(context)
                          .pushReplacement(MaterialPageRoute(builder: (cp) {
                        return const Homescreen();
                      }));
                    }
                  },
                  color: Colors.blueGrey,
                  height: 60,
                  child: CustomText(text: "Create Account",align:TextAlign.center, isBold: true, colours:0xFFFFFFFF, fontSize: 30,)),
            ),
          ),
        ]),
      ),
    );
  }
}
