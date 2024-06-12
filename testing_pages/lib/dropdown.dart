import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
String selectedValue ='Orange';
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            margin: EdgeInsets.all(10),
            height: 70,
           // color:Colors.red,
//width: MediaQuery.of(context).size.width,
            width: 100,
            // ignore: prefer_const_literals_to_create_immutables
             child: DropdownButton<String>(
              dropdownColor: Colors.grey.shade200,
              isExpanded: true,
              value: selectedValue,
              icon: Icon(Icons.arrow_circle_down_rounded),
              items:<String>[
                'Orange',
                'Apple',
                'Banana',
                'Mango',
                'Grapes',
              ].map<DropdownMenuItem<String>>((String value){

                return DropdownMenuItem<String>(value:value, child: Text(value));
              }).toList(),
             onChanged:((String? newvalue)
              {
                setState(() {
                  selectedValue = newvalue!;
                });
               })
          )
          ),
          
        ]),
      ),
    );
  }
}
