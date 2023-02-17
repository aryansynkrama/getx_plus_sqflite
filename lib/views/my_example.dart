import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class MyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isDesktop = size.width > 1200;
    final bool isTablet = size.width > 768 && size.width <= 1200;
    final bool isMobile = size.width <= 768;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Dashboard'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: isMobile ? 1 : 2,
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Text('First Column'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 1 : 3,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Second Column'),
                      ),
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.green,
                        child: Center(
                          child: Text('Third Column'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: isMobile ? 1 : 2,
                    child: Container(
                      color: Colors.yellow,
                      child: Center(
                        child: Text('Fourth Column'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: isMobile ? 1 : 3,
                    child: Container(
                      color: Colors.purple,
                      child: Center(
                        child: Text('Fifth Column'),
                      ),
                    ),
                  ),
                  if (!isMobile)
                    Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.orange,
                        child: Center(
                          child: Text('Sixth Column'),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  BarChart(this.seriesList, {required this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(),
    );
  }
}



class SalesData {
  final String year;
  final int sales;

  SalesData(this.year, this.sales);
}