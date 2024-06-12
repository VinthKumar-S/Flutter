import 'package:car_washing_app/pages/admin.dart';
import 'package:car_washing_app/pages/employee.dart';
import 'package:car_washing_app/pages/Login/log_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCheck extends StatefulWidget {
  const UserCheck({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserCheckState createState() => _UserCheckState();
}

class _UserCheckState extends State<UserCheck> {
  void initState() {
    super.initState();
    check();
  }

  void check() async {
    var id;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString('email');
    if (id != null) {
      // ignore: use_build_context_synchronously
      if (id == 'Vimal') {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Admin()),
        );
      } else if (id == 'Raj') {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Employee()),
        );
      }
    } else if (id == null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogIn()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
