import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:car_washing_app/pages/Login/log_in.dart';

import '../Add_Customer/add_customer.dart';
import '../Placing_Order/placing_order.dart';
import '../Report/report.dart';
import '../Service_list/service_list.dart';
import '../admin.dart';

class PreviousOrder extends StatefulWidget {
  const PreviousOrder({Key? key}) : super(key: key);

  @override
  _PreviousOrderState createState() => _PreviousOrderState();
}

class _PreviousOrderState extends State<PreviousOrder> {
  List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "Name": "Mathavan",
      "Service": "WaterService",
      "Service cost": "8000",
      "Labour cost": "800",
      "Amoount": "2800"
    },
    {
      "id": 2,
      "Name": "Murugan",
      "Service": "PolishService",
      "Service cost": "12000",
      "Labour cost": "800",
      "Amoount": "12800"
    },
    {
      "id": 3,
      "Name": "Karan",
      "Service": "WaterService",
      "Service cost": "8000",
      "Labour cost": "800",
      "Amoount": "2800"
    },
    {
      "id": 4,
      "Name": "Dinesh",
      "Service": "PolishService",
      "Service cost": "12000",
      "Labour cost": "800",
      "Amoount": "12800"
    },
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Previous Order'),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Search())),
              icon: Icon(Icons.search))
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: _allUsers.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => ViewData(),
                            settings:
                                RouteSettings(arguments: _allUsers[index])));
                      },
                      child: Card(
                        key: ValueKey(_allUsers[index]["id"]),
                        color: Color.fromARGB(255, 35, 208, 231),
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _allUsers[index]["id"].toString(),
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          title: Text(
                            _allUsers[index]['Name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            '${_allUsers[index]['Service']}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, dynamic>> _allUsers = [
    {
      "id": 1,
      "Name": "Mathavan",
      "Service": "WaterService",
      "Service cost": "8000",
      "Labour cost": "800",
      "Amoount": "2800"
    },
    {
      "id": 2,
      "Name": "Murugan",
      "Service": "PolishService",
      "Service cost": "12000",
      "Labour cost": "800",
      "Amoount": "12800"
    },
    {
      "id": 3,
      "Name": "Karan",
      "Service": "WaterService",
      "Service cost": "8000",
      "Labour cost": "800",
      "Amoount": "2800"
    },
    {
      "id": 4,
      "Name": "Dinesh",
      "Service": "PolishService",
      "Service cost": "12000",
      "Labour cost": "800",
      "Amoount": "12800"
    },
  ];

  var _searchvalue = TextEditingController();

  List<Map<String, dynamic>> _foundUsers = [];

  initState() {
    _foundUsers = _allUsers;
    super.initState();
  }

  void _runFilter(String value) {
    // ignore: unused_local_variable
    List<Map<String, dynamic>> result = [];
    if (value.isEmpty) {
      result = _allUsers;
    } else {
      result = _allUsers
          .where(((element) => element["Name"]
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase())))
          .toList();
    }
    setState(() {
      _foundUsers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child: TextField(
            onChanged: (value) => _runFilter(value),
            controller: _searchvalue,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchvalue.text = '';
                  },
                ),
                hintText: 'Search',
                border: InputBorder.none),
          )),
        )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => ViewData(),
                              settings: RouteSettings(
                                  arguments: _foundUsers[index])));
                        },
                        child: Card(
                          key: ValueKey(_foundUsers[index]["id"]),
                          color: Color.fromARGB(255, 35, 208, 231),
                          elevation: 4,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: ListTile(
                            leading: Text(
                              _foundUsers[index]["id"].toString(),
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            ),
                            title: Text(
                              _foundUsers[index]["Name"],
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              _foundUsers[index]["Service"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewData createState() => _ViewData();
}

class _ViewData extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    String selected_id = ModalRoute.of(context)!.settings.arguments.toString();

    selected_id = selected_id.replaceAll("{", "");
    selected_id = selected_id.replaceAll("}", "");
    selected_id = selected_id.replaceAll(":", "");
    selected_id = selected_id.replaceAll(",", "");

    List<String> list = selected_id.split(" ");

    print(list);

    return Scaffold(
      appBar: AppBar(
        title: Text('ViewData'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Full Details",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  "Name",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    list.elementAt(3),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Service",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 66),
                  child: Text(
                    list.elementAt(5),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Service Cost",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    list.elementAt(8),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Labour Cost",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text(
                    list.elementAt(11),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Amount",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 64),
                  child: Text(
                    list.elementAt(13),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
