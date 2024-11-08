import 'package:flutter/material.dart';
import 'package:seventhproject/homescreen.dart';
import 'package:seventhproject/createaccount.dart';
import 'package:seventhproject/widgets/custom_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    return Scaffold(
          backgroundColor: Colors.grey,
      body: ListView(
        children: [SizedBox(
          width: double.infinity,
          child: Column(children: [
             Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Center(
                  child: CustomText(text: "Fanzawy",align:TextAlign.center, isBold: true, colours: 0xFF000000, fontSize: 28,))),
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
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("Password:",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
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
                      if (password.text == "hima"&&username.text=="filo") {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (cp) {
                          return const Homescreen();
                        }));
                      }
                    },
                    color: Colors.blueGrey,
                    height: 60,
                    child:  CustomText(text: "Login",align:TextAlign.center, isBold: true, colours:0xFFFFFFFF, fontSize: 30,)),
              ),
            ),
                            TextButton(onPressed:(){
                              Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (cp) {
                          return  Createaccount();
                        }));
                            } ,child: CustomText(text: "to create a new account click here", isBold: true, colours:0xFF000000, fontSize: 20, align: TextAlign.center),) 
          ]),
        ),]
      ),
    );
  }
}
