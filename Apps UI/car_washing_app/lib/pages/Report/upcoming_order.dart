import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class UpcomingOrder extends StatefulWidget {
  const UpcomingOrder({Key? key}) : super(key: key);

  @override
  _UpcomingOrderState createState() => _UpcomingOrderState();
}

class _UpcomingOrderState extends State<UpcomingOrder> {
  Widget build(BuildContext context) {
    return Scaffold(
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
            "Date",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          DataColumn(
              label: Text(
            "No.",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Car Wash')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Vino')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('Oil Filter')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Bala')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Break Check')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Pravin')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('Painting')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Mahesh')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('Car Wash')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Vino')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('Oil Filter')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Bala')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('Break Check')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Pravin')),
            DataCell(Text('TN76AC2688')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('Painting')),
            DataCell(Text('22/7/2023')),
            DataCell(Text('Mahesh')),
            DataCell(Text('TN76AC2688')),
          ]),
        ],
      ),
    ));
  }
}
