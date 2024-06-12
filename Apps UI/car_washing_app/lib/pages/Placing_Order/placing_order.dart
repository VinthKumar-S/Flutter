import 'package:car_washing_app/pages/Service_list/service_list.dart';
import 'package:flutter/material.dart';

import '../Add_Customer/add_customer.dart';
import '../Order/previous_order.dart';
import '../Report/report.dart';
import '../admin.dart';

class PlacingOrder extends StatefulWidget {
  const PlacingOrder({Key? key}) : super(key: key);

  @override
  _PlacingOrderState createState() => _PlacingOrderState();
}

String Service_names = 'Services';
int _currentItem = 0;

class _PlacingOrderState extends State<PlacingOrder> {
  var _username = TextEditingController();
  var _vehiclenum = TextEditingController();
  var _mobilenum = TextEditingController();
  var _date_of_birth = TextEditingController();
  var _service_controller = TextEditingController();

  bool name = false;
  bool vnum = false;
  bool mobnum = false;
  bool dob = false;
  bool sev = false;

  List<DynamicWidget> listDynamic = [];
  addDynamic() {
    listDynamic.add(new DynamicWidget());
  }

  delete_item(int index) {
    listDynamic.removeAt(index);
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
          })),
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _username,
                decoration: InputDecoration(
                  hintText: 'Name',
                  label: Text(
                    'Name',
                    style: TextStyle(color: Color.fromARGB(255, 35, 208, 231)),
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
                    style: TextStyle(color: Color.fromARGB(255, 35, 208, 231)),
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
                    style: TextStyle(color: Color.fromARGB(255, 35, 208, 231)),
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
                  hintText: 'Date',
                  label: Text(
                    'Date',
                    style: TextStyle(color: Color.fromARGB(255, 35, 208, 231)),
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
              TextField(
                controller: _service_controller,
                decoration: InputDecoration(
                  hintText: 'Add Service',
                  label: Text(
                    'Add Service',
                    style: TextStyle(color: Color.fromARGB(255, 35, 208, 231)),
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
                  errorText: sev ? 'No Service' : null,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: listDynamic.length,
                  itemBuilder: (_, index) {
                    _currentItem = index;
                    return listDynamic[index];
                  }),
              const SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  Service_names = _service_controller.text;
                  addDynamic();
                },
                child: Text(
                  'Add +',
                ),
                style: TextButton.styleFrom(
                    fixedSize: const Size(50, 40),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    backgroundColor: Color.fromARGB(255, 35, 208, 231)),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    _username.text.isEmpty ? name = true : name = false;
                    _vehiclenum.text.isEmpty ? vnum = true : vnum = false;
                    _mobilenum.text.isEmpty ? mobnum = true : mobnum = false;
                    _date_of_birth.text.isEmpty ? dob = true : dob = false;
                    if (dob == false &&
                        mobnum == false &&
                        vnum == false &&
                        name == false) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Admin()),
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
            ]),
          ),
        ),
      )),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 10, top: 5),
              height: 30,
              width: 280,
              color: Colors.blue,
              child: Text(Service_names, style: TextStyle(color: Colors.white)),
            ),
            GestureDetector(
              child: Icon(Icons.delete, color: Colors.red),
              onTap: () {},
            ),
          ],
        ),
      ]),
    );
  }
}
