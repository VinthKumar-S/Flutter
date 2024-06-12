import 'package:car_washing_app/pages/Report/missed_contact.dart';
import 'package:flutter/material.dart';

class MissedOrder extends StatefulWidget {
  const MissedOrder({Key? key}) : super(key: key);

  @override
  _MissedOrderState createState() => _MissedOrderState();
}

class _MissedOrderState extends State<MissedOrder> {
  List<MissedContact> contacts = [
    MissedContact("ram", "1234567890", "Car Wash", false),
    MissedContact("mathi", "1234567890", "Painting", false),
    MissedContact("vinoth", "1234567890", "Oil Filter", false),
    MissedContact("rajan", "1234567890", "Car Wash", false),
    MissedContact("ram", "1234567890", "Car Wash", false),
    MissedContact("mathi", "1234567890", "Painting", false),
    MissedContact("vinoth", "1234567890", "Oil Filter", false),
    MissedContact("rajan", "1234567890", "Car Wash", false),
    MissedContact("ram", "1234567890", "Car Wash", false),
    MissedContact("mathi", "1234567890", "Painting", false),
    MissedContact("vinoth", "1234567890", "Oil Filter", false),
    MissedContact("rajan", "1234567890", "Car Wash", false),
  ];

  List<MissedContact>? selectedContact = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 40,
                      ),
                      title: Text(
                        contacts[index].service,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        'No:' +
                            contacts[index].phoneno +
                            ',' +
                            "Name:" +
                            contacts[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: contacts[index].isSelected
                          ? Icon(Icons.check_circle, color: Colors.green[700])
                          : const Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey,
                            ),
                      onTap: () {
                        setState(() {
                          contacts[index].isSelected =
                              !contacts[index].isSelected;
                          if (contacts[index].isSelected = true) {
                            selectedContact?.add(MissedContact(
                                contacts[index].name,
                                contacts[index].phoneno,
                                contacts[index].service,
                                true));
                          } else if (contacts[index].isSelected == false) {
                            contacts.removeWhere((element) =>
                                element.name == contacts[index].name);
                          }
                        });
                      },
                    );
                  }),
            ),
            selectedContact!.length > 0
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: TextButton(
                      child: Text('Delete(${selectedContact?.length})'),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          fixedSize: Size(400, 50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          elevation: 10.0),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
