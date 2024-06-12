import 'package:car_washing_app/pages/Order/previous_order.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:car_washing_app/pages/Login/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Placing_Order/placing_order.dart';
import '../Report/report.dart';
import '../Service_list/service_list.dart';
import '../admin.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({Key? key}) : super(key: key);

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  late SharedPreferences sharedPreferences;
  void iniState() async {
    sharedPreferences = await SharedPreferences.getInstance();

    super.initState();
  }

  String _filename = 'Upload Photo';
  var picked;
  var _username = TextEditingController();
  var _vehiclenum = TextEditingController();
  var _mobilenum = TextEditingController();
  var _date_of_birth = TextEditingController();
  var _marriage_date = TextEditingController();
  var _addresss = TextEditingController();
  var _marrial_status = '';

  bool mstatus = false;
  bool name = false;
  bool vnum = false;
  bool mobnum = false;
  bool dob = false;
  bool mdate = false;
  bool address = false;
  String dropdownvalue = 'Married';
  var items = [
    'Married',
    'Single',
  ];

  void Dbox() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select Image : '),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green),
                )
              ],
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Customer'),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Admin()),
                    );
                  },
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
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: _username,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        label: Text(
                          'Name',
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 208, 231)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          //<-- SEE HERE
                        ),
                        errorText: name ? 'Name is Empty' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: _vehiclenum,
                      decoration: InputDecoration(
                        hintText: 'TN7689',
                        label: Text(
                          'Vehicle No.',
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 208, 231)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          //<-- SEE HERE
                        ),
                        errorText: vnum ? 'Vehicle No is Empty' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      controller: _mobilenum,
                      decoration: InputDecoration(
                        hintText: 'Mobile No',
                        label: Text(
                          'Mobile No',
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 208, 231)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          //<-- SEE HERE
                        ),
                        errorText: mobnum ? 'Mobile No. is Empty' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: _date_of_birth,
                      decoration: InputDecoration(
                        hintText: 'Date of Birth',
                        label: Text(
                          'Date of Birth',
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 208, 231)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          //<-- SEE HERE
                        ),
                        errorText: vnum ? 'Date of Birth is Empty' : null,
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2101));
                        if (pickeddate != null) {
                          setState(
                            () {
                              String val = (pickeddate.day).toString();
                              val = val + '-' + (pickeddate.month).toString();
                              val = val + '-' + (pickeddate.year).toString();
                              _date_of_birth.text = val;
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      controller: _marriage_date,
                      decoration: InputDecoration(
                        hintText: 'Marriage Date',
                        label: Text(
                          'Marriage Date',
                          style: TextStyle(
                              color: Color.fromARGB(255, 35, 208, 231)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 35, 208, 231),
                          ), //<-- SEE HERE
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          //<-- SEE HERE
                        ),
                        errorText: mdate ? 'Marriage Date is Empty' : null,
                      ),
                      onTap: () async {
                        DateTime? selecteddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2101));
                        if (selecteddate != null) {
                          setState(
                            () {
                              String val = (selecteddate.day).toString();
                              val = val + '-' + (selecteddate.month).toString();
                              val = val + '-' + (selecteddate.year).toString();
                              _marriage_date.text = val;
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: _addresss,
                      keyboardType: TextInputType.multiline,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Address",
                        label: Text('Address',
                            style: TextStyle(
                                color: Color.fromARGB(255, 35, 208, 231))),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Color.fromARGB(255, 35, 208, 231),
                        )),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 35, 208, 231))),
                        errorText: address ? 'Address is Empty' : null,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 35, 208, 231))),
                        errorText: mstatus ? 'Select Status' : null,
                      ),
                      value: dropdownvalue,
                      // icon: const Icon(Icons.keyboard_arrow_down),

                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(
                                color: Color.fromARGB(255, 35, 208, 231)),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          _marrial_status = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        picked = await FilePicker.platform.pickFiles(
                          type: FileType.any,
                          allowMultiple: false,
                        );

                        if (picked != null) {
                          // ignore: avoid_print

                          setState(() {
                            _filename = picked.files.first.name;
                          });
                        } else if (picked == null) {
                          Dbox();
                        }
                      },
                      child: Text(
                        _filename,
                      ),
                      style: TextButton.styleFrom(
                          fixedSize: const Size(320, 20),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          backgroundColor: Color.fromARGB(255, 35, 208, 231)),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          _username.text.isEmpty ? name = true : name = false;
                          _vehiclenum.text.isEmpty ? vnum = true : vnum = false;
                          _mobilenum.text.isEmpty
                              ? mobnum = true
                              : mobnum = false;
                          _date_of_birth.text.isEmpty
                              ? dob = true
                              : dob = false;
                          _marriage_date.text.isEmpty
                              ? mdate = true
                              : mdate = false;
                          _addresss.text.isEmpty
                              ? address = true
                              : address = false;
                          _marrial_status.isEmpty
                              ? mstatus = true
                              : mstatus = false;
                          if (picked == null) {
                            Dbox();
                          } else if (picked != null &&
                              mstatus == false &&
                              address == false &&
                              mdate == false &&
                              dob == false &&
                              mobnum == false &&
                              vnum == false &&
                              name == false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Admin()),
                            );
                          }
                        });
                      },
                      child: Text(
                        'Submit',
                      ),
                      style: TextButton.styleFrom(
                          fixedSize: const Size(320, 40),
                          foregroundColor: Colors.white,
                          elevation: 2,
                          backgroundColor: Colors.red),
                    ),
                  ])),
        ));
  }
}
