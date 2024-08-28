import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/textstyle.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Container(
        decoration:  const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(0xFF04776C),
              Color(0xFF04776C),
              // Color(0xFF5EB3A2),
            ])),
        child: Column(
          children: [
               Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: btn2Color)),
                ),
                const Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color:Colors.white),),
                const SizedBox(
                  height: 60,
                ),
                
              ],
            ),
            Expanded(child: Container(
              decoration: const BoxDecoration(
                 color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
             
              
              child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Username",
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: Icon(Icons.remove_red_eye),
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              elevation: 8,
                              minimumSize: const Size.fromHeight(55),
                              backgroundColor: canvasColor, //Colors.deepOrange,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: const Text(
                            "Log In",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black54),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.deepOrange),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
            ),
            ),
          ],
        ),
      )),
    );
  }
}
