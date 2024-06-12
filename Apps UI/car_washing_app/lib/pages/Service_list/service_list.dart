import 'package:car_washing_app/pages/Add_Customer/add_customer.dart';
import 'package:car_washing_app/pages/Placing_Order/placing_order.dart';
import 'package:car_washing_app/pages/Report/report.dart';
import 'package:flutter/material.dart';

import '../Order/previous_order.dart';
import '../admin.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key}) : super(key: key);

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Service List'),
          automaticallyImplyLeading: false,
          leading: Builder(builder: (context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
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
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text(
                "No.",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Service",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Service Cast",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Labour Cost",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Edit",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Car Wash')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Painting')),
                DataCell(Text('2000')),
                DataCell(Text('800')),
                DataCell(Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
                DataCell(Icon(Icons.delete, color: Colors.red)),
              ]),
            ],
          ),
        ));
  }
}
