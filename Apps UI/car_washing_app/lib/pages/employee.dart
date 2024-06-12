import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:car_washing_app/pages/Login/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Employee extends StatefulWidget {
  const Employee({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeState createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Employee'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Expanded(
                    child: AlertDialog(
                      title: const Text('Logut options'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('cancel'),
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 35, 208, 231),
                            foregroundColor: Colors.white,
                            elevation: 5.0,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();

                            sharedPreferences.remove('email');
                            // ignore: use_build_context_synchronously

                            // ignore: use_build_context_synchronously, avoid_print

                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LogIn()),
                            );
                          },
                          child: Text('yes'),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            elevation: 5.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Text('Logout'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
      body: const Center(),
    );
  }
}
