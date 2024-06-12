import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnualReport extends StatefulWidget {
  const AnualReport({Key? key}) : super(key: key);

  @override
  _AnualReportState createState() => _AnualReportState();
}

class _AnualReportState extends State<AnualReport> {
  String showYear = 'Select Year';
  DateTime _selectedYear = DateTime.now();

  selectYear(context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Select Year'),
              content: SizedBox(
                  width: 300,
                  height: 300,
                  child: YearPicker(
                    firstDate: DateTime(DateTime.now().year - 10, 1),
                    lastDate: DateTime(2053),
                    initialDate: DateTime.now(),
                    selectedDate: _selectedYear,
                    onChanged: (DateTime datetime) {
                      setState(() {
                        _selectedYear = datetime;
                        showYear = "${datetime.year}";
                      });
                      Navigator.pop(context);
                    },
                  )));
        });
  }

  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final List<ChartData> chartData = [
      ChartData(DateTime(2022, 1), 300000),
      ChartData(DateTime(2022, 2), 300000),
      ChartData(DateTime(2022, 3), 340000),
      ChartData(DateTime(2022, 4), 250000),
      ChartData(DateTime(2022, 5), 600000),
      ChartData(DateTime(2022, 6), 300000),
      ChartData(DateTime(2022, 7), 300000),
      ChartData(DateTime(2022, 8), 340000),
      ChartData(DateTime(2022, 9), 250000),
      ChartData(DateTime(2022, 10), 600000),
      ChartData(DateTime(2022, 11), 250000),
      ChartData(DateTime(2022, 12), 600000),
    ];
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 550,
              width: 500,
              child: SfCartesianChart(
                  isTransposed: true,
                  //  legend: Legend(isVisible: true),
                  primaryYAxis: NumericAxis(minimum: 100000, maximum: 1000000),
                  primaryXAxis: DateTimeCategoryAxis(),
                  series: <ChartSeries<ChartData, DateTime>>[
                    // Renders Column chart

                    ColumnSeries<ChartData, DateTime>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y)
                  ])),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 35, 208, 231),
                  // border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                //width: MediaQuery.of(context).size.width,
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      showYear,
                    ),
                    GestureDetector(
                      onTap: () {
                        selectYear(context);
                      },
                      child: Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Submit'),
                style: TextButton.styleFrom(
                  fixedSize: Size(60, 45),
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  elevation: 2.0,
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}
