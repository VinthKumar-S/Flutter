import 'package:car_washing_app/pages/Order/previous_order.dart';
import 'package:car_washing_app/pages/Report/report.dart';
import 'package:car_washing_app/pages/Service_list/service_list.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:car_washing_app/pages/Login/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Add_Customer/add_customer.dart';
import 'package:car_washing_app/pages/Placing_Order/placing_order.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late SharedPreferences sharedPreferences;
  void iniState() async {
    sharedPreferences = await SharedPreferences.getInstance();

    super.initState();
  }

  Color _colorContainer = Color.fromARGB(255, 35, 208, 231);

  Color _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);

  Color _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
  Color _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
  Color _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
  Color _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home'),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
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
                            child: const Text('cancel'),
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 35, 208, 231),
                              foregroundColor: Colors.white,
                              elevation: 5.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              // ignore: use_build_context_synchronously

                              // ignore: use_build_context_synchronously, avoid_print

                              // ignore: use_build_context_synchronously
                              // Navigator.pop(context);

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogIn()),
                              );
                              //   sharedPreferences.remove('email');
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
        drawer: Drawer(
          elevation: 16.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const UserAccountsDrawerHeader(
                  // ignore: prefer_interpolation_to_compose_strings

                  accountName: Text('Vimal'),
                  accountEmail: Text(''),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text('Xyz'),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 35, 208, 231),
                  ),
                ),
                ListTile(
                  title: const Text('Home'),
                  leading: const Icon(Icons.home),
                  onTap: () {},
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text('Add Customer'),
                  leading: Icon(Icons.account_circle_rounded),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCustomer()),
                    );
                  },
                ),
                Divider(
                  height: 0.1,
                ),
                ExpansionTile(
                  title: Text('Order'),
                  leading: Icon(Icons.shopping_cart),
                  childrenPadding: EdgeInsets.only(left: 60), //children padding
                  children: [
                    ListTile(
                      title: Text("Placing An Order"),
                      leading: Icon(Icons.visibility),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PlacingOrder()),
                        );
                      },
                    ),

                    ListTile(
                      title: Text("Previous Order"),
                      leading: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PreviousOrder()),
                        );
                      },
                    ),

                    //more child menu
                  ],
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text("Report"),
                  leading: Icon(Icons.report),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Report()),
                    );
                  },
                ),
                Divider(
                  height: 0.1,
                ),
                ListTile(
                  title: Text('Service'),
                  leading: Icon(Icons.home_repair_service),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServiceList()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer = _colorContainer == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCustomer()),
                      );
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.person,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          Text(
                            'Add User',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer,
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer_2 = _colorContainer_2 == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.arrow_forward,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          Text(
                            'Upcoming Service',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer_2,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer_3 = _colorContainer_3 == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.calendar_today,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          Text(
                            'Today Services',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer_3,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer_4 = _colorContainer_4 == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.home_repair_service,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          const Text(
                            'Services',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer_4,
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer_5 = _colorContainer_5 == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_6 = Color.fromARGB(255, 35, 208, 231);
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.visibility,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          Text(
                            'Placing Order',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer_5,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _colorContainer_6 = _colorContainer_6 == Colors.red
                          ? Color.fromARGB(255, 35, 208, 231)
                          : Colors.red;
                      _colorContainer_2 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_3 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_4 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer_5 = Color.fromARGB(255, 35, 208, 231);
                      _colorContainer = Color.fromARGB(255, 35, 208, 231);
                    });
                  },
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // IconButton(
                          //  onPressed: () {},
                          Icon(
                            Icons.arrow_back_ios_new,
                            size: 60,
                            color: Colors.white,
                          ), //),
                          Text(
                            'Previous Order',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: _colorContainer_6,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0),
                          )
                        ]),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ),
          ),
        ));
  }
}
