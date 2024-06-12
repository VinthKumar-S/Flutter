import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
      ),
      body:DataTable(
        columns: [
          DataColumn(label: Text('Roll No')),
          DataColumn(label: Text('Name'))
        ],
        rows: [
          DataRow(cells: [DataCell(Text('AE1OO1')),DataCell(Text('VINITH'))])
          ,DataRow(cells: [DataCell(Text('AE1002')),DataCell(Text('JAYARAM'))])
        ],
      )
    );
  }
}






