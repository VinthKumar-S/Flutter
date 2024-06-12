import 'package:car_washing_app/pages/Order/previous_order.dart';
import 'package:car_washing_app/pages/Report/today_report.dart';
import 'package:car_washing_app/pages/Report/upcoming_order.dart';
import 'package:car_washing_app/pages/Service_list/service_list.dart';
import 'package:flutter/material.dart';
import 'package:car_washing_app/pages/Report/missed_order.dart';

import '../Add_Customer/add_customer.dart';
import '../Placing_Order/placing_order.dart';
import '../admin.dart';
import 'anual_report.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Report'),
          leading: Builder(builder: (context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                });
          }),
          bottom: TabBar(
            isScrollable: true, // Required
            unselectedLabelColor: Colors.white60, // Other tabs color
            labelPadding:
                EdgeInsets.symmetric(horizontal: 30), // Space between tabs
            indicator: UnderlineTabIndicator(
              borderSide:
                  BorderSide(color: Colors.white, width: 2), // Indicator height
              insets: EdgeInsets.symmetric(horizontal: 48), // Indicator width
            ),
            tabs: [
              Tab(
                text: 'Annual',
              ),
              Tab(
                text: 'Today',
              ),
              Tab(
                text: 'Upcoming Services',
              ),
              Tab(
                text: 'Missed Services',
              )
            ],
          ),
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
        body: TabBarView(children: [
          AnualReport(),
          TodayReport(),
          UpcomingOrder(),
          MissedOrder(),
        ]),
      ),
    );
  }
}
