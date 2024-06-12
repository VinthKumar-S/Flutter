// ignore_for_file: avoid_print

import 'package:car_washing_app/pages/admin.dart';
import 'package:car_washing_app/pages/employee.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  // ignore: non_constant_identifier_names
  late var user_id = TextEditingController();
  final password = TextEditingController();
  bool id = false;
  bool pass = false;
  _incrementCounter() async {
    var val = '';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      val = user_id.text;
    });
    // ignore: prefer_interpolation_to_compose_strings

    prefs.setString('email', val);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 35, 208, 231),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(children: <Widget>[
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 250,
                ),
              ),
              TextField(
                controller: user_id,
                decoration: InputDecoration(
                  labelText: "User Id",
                  labelStyle:
                      const TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorText: id ? 'Id is Empty' : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle:
                      const TextStyle(fontSize: 15, color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorText: pass ? 'Password is Empty' : null,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              FloatingActionButton(
                onPressed: () async {
                  setState(() {
                    password.text.isEmpty ? pass = true : pass = false;
                    user_id.text.isEmpty ? id = true : id = false;
                  });
                  if (password.text == '1' && user_id.text == 'V') {
                    // ignore: use_build_context_synchronously
                    _incrementCounter();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Admin()),
                    );
                  } else if (password.text == '123' && user_id.text == 'Raj') {
                    // ignore: use_build_context_synchronously
                    _incrementCounter();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Employee()),
                    );
                  } else {
                    password.text = '';
                    user_id.text = '';
                  }
                },
                elevation: 5.0,
                hoverColor: Color.fromARGB(255, 35, 208, 231),
                hoverElevation: 5.0,
                // ignore: sort_child_properties_last
                child: const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 35, 208, 231),
                ),
                backgroundColor: Colors.white,
              ),
            ]),
          ),
        ));
  }
}
