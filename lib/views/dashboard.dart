import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen_with_getx/components/side_view.dart';

import '../responsive.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final GlobalKey<AnimatedCircularChartState> _chartKey1 =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey2 =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey3 =
      GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<AnimatedCircularChartState> _chartKey4 =
      GlobalKey<AnimatedCircularChartState>();

  List<IconData?> icons = [
    Icons.home_outlined,
    Icons.add_circle_outline,
    Icons.warehouse_outlined,
    Icons.person_outline,
    Icons.bar_chart_outlined,
    Icons.settings_outlined,
  ];
  List<IconData?> bottomGridViewIcons = [
    Icons.south_east,
    Icons.south_east,
    Icons.north_east,
    Icons.north_east
  ];
  List<Color?> bottomGridViewIconsColor = [
    Colors.red,
    Colors.green,
    Colors.green,
    Colors.black
  ];
  List<String> title = [
    'Home',
    'Projects',
    'Billings',
    'Team Members',
    'Stats',
    'Settings'
  ];
  List<String> titleListView = ['230k', '8.549k', '1.423k', '\$9745'];
  bool removeVar = false;
  List<Color?> bottomGridViewColors = [
    const Color(0xffffefe2),
    const Color(0xffeffcef),
    const Color(0xffe6f5f9),
    const Color(0xfff4f6fa)
  ];
  List<String> subtitleListView = ['Sales', 'Customers', 'Products', 'Revenue'];
  List<IconData?> iconListView = [
    Icons.percent,
    Icons.person_pin,
    Icons.layers_outlined,
    Icons.pie_chart,
  ];
  List<String> views = ['Views', 'Visits', 'Orders'];
  List<IconData?> icon = [
    Icons.remove_red_eye_outlined,
    Icons.explore,
    Icons.storefront
  ];
  List<String> numbers = ['500', '2000', '5100'];
  List<String> days = ['Per Day', 'Per Minutes', 'Per Day'];
  List<String> sales = ['Sales', 'Profit', 'Orders', 'Visits'];
  List<String> totalSalesToday = [
    'Total Sales Today',
    'Per day ratio',
    'Total Order Today',
    'Total Visit today'
  ];
  List<String> fiveHundred = ['\$500', '\$150', '1000', '400'];
  List<double> fiftyFive = [55, 30, 80, 70];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: SideMenu(icons: icons, title: title),
              ),
            const VerticalDivider(
              color: Colors.grey,
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: 35 *
                                  MediaQuery.of(context).size.height /
                                  1080),
                          Container(
                            width: screenWidth * 0.28,
                            height: screenHeight * 0.07,
                            decoration: const BoxDecoration(
                                // color: Colors.red,
                                ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Search for stats',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(left: 14, right: 8),
                                  child: Icon(Icons.search),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.elliptical(15, 15)),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                              height: 35 *
                                  MediaQuery.of(context).size.height /
                                  1080),
                          SizedBox(
                            width: screenWidth * 0.42,
                            child: Row(
                              children: [
                                RichText(
                                  text: const TextSpan(
                                    text: 'Hello David',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      letterSpacing: 1.05,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '\nWelcome Back !',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: 370 *
                                        MediaQuery.of(context).size.width /
                                        1920),
                                filterAndText(screenWidth, screenHeight),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: 20 *
                                  MediaQuery.of(context).size.height /
                                  1080),
                          Container(
                            width: screenWidth * 0.42,
                            height: screenHeight * 0.28,
                            decoration: const BoxDecoration(
                              color: Color(0xfffaf8f4),
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(50, 50)),
                            ),
                            child: TopGridView(
                              icon: icon,
                              views: views,
                              numbers: numbers,
                              days: days,
                            ),
                          ),
                          SizedBox(
                              height: 25 *
                                  MediaQuery.of(context).size.height /
                                  1080),
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: screenHeight * 0.4,
                            width: screenWidth * 0.42,
                            child: bottomGridView(screenWidth, screenHeight),
                          ),
                        ],
                      ),
                      SizedBox(
                          width: 70 * MediaQuery.of(context).size.width / 1920),
                      Container(
                        height: screenHeight * 0.88,
                        width: screenWidth * 0.245,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(30, 30),
                          ),
                        ),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          child: Column(
                            children: [
                              SizedBox(
                                  height: 35 *
                                      MediaQuery.of(context).size.height /
                                      1080),
                              SizedBox(
                                width: screenWidth * 0.245,
                                child: salesRevenueText(),
                              ),
                              SizedBox(
                                width: screenWidth * 0.245,
                                height: screenHeight * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 45,
                                    right: 45,
                                    top: 20,
                                  ),
                                  child: TopRightListView(titleListView: titleListView, iconListView: iconListView, subtitleListView: subtitleListView),
                                ),
                              ),
                              SingleChildScrollView(
                                physics: NeverScrollableScrollPhysics(),
                                child: SizedBox(
                                  width: screenWidth * 0.245,
                                  child: statisticsText(),
                                ),
                              ),
                              SizedBox(
                                  height: 20 *
                                      MediaQuery.of(context).size.height /
                                      1080),
                              Container(
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.25,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                                child: MyBarGraph(screenWidth: screenWidth),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 14 / 100),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView bottomGridView(double screenWidth, double screenHeight) {
    return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 30,
                              childAspectRatio: 2.2,
                            ),
                            itemBuilder: (context, index) {
                              GlobalKey<AnimatedCircularChartState> key;
                              if (index == 0) {
                                key = _chartKey1;
                              } else if (index == 1) {
                                key = _chartKey2;
                              } else if (index == 2) {
                                key = _chartKey3;
                              } else {
                                key = _chartKey4;
                              }
                              return bottomGridViewContainer(screenWidth, screenHeight, index, key);
                            },
                          );
  }

  Container bottomGridViewContainer(double screenWidth, double screenHeight, int index, GlobalKey<AnimatedCircularChartState> key) {
    return Container(
                                width: screenWidth * 0.18,
                                height: screenHeight * 0.2,
                                decoration: BoxDecoration(
                                  color: bottomGridViewColors[index],
                                  borderRadius: const BorderRadius.all(
                                      Radius.elliptical(30, 30)),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 21),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 7),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 4),
                                              child: Text(
                                                sales[index],
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Text(
                                                totalSalesToday[index],
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              fiveHundred[index],
                                              style: const TextStyle(
                                                fontSize: 28,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            width: 130,
                                            child: Align(
                                              alignment:
                                                  Alignment.centerRight,
                                              child: Icon(
                                                bottomGridViewIcons[index],
                                                color:
                                                    bottomGridViewIconsColor[
                                                        index],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 130,
                                            child: AnimatedCircularChart(
                                              chartType:
                                                  CircularChartType.Radial,
                                              key: key,
                                              size: const Size(70, 70),
                                              initialChartData: [
                                                CircularStackEntry(
                                                  [
                                                    CircularSegmentEntry(
                                                      fiftyFive[index],
                                                      Colors.black,
                                                    ),
                                                    CircularSegmentEntry(
                                                      35.0,
                                                      bottomGridViewColors[
                                                          index],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                              holeLabel:
                                                  '${fiftyFive[index].toString()}%',
                                              labelStyle: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
  }

  Padding salesRevenueText() {
    return const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 80),
                                child: Text(
                                  'Sales Revenue',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              );
  }

  Padding statisticsText() {
    return const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 80),
                                  child: Text(
                                    'Statistics',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                );
  }

  FittedBox filterAndText(double screenWidth, double screenHeight) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: screenWidth * 0.065,
        height: screenHeight * 0.05,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.elliptical(12, 15)),
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Filters',style: TextStyle(fontSize: screenHeight * 0.023),maxLines: 1,overflow: TextOverflow.ellipsis,),
            Icon(Icons.tune,size: screenHeight * 0.03),
          ],
        ),
      ),
    );
  }
}

class TopRightListView extends StatelessWidget {
  const TopRightListView({
    super.key,
    required this.titleListView,
    required this.iconListView,
    required this.subtitleListView,
  });

  final List<String> titleListView;
  final List<IconData?> iconListView;
  final List<String> subtitleListView;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: titleListView.length,
      itemBuilder: (context, index) {
        return ListTile(
          horizontalTitleGap: 20,
          minVerticalPadding: 10,
          leading: CircleAvatar(
            backgroundColor:
                const Color(0xffe1e1e1),
            radius: 40,
            child: Icon(
              iconListView[index],
              color: Colors.black,
            ),
          ),
          title: Padding(
            padding:
                const EdgeInsets.only(bottom: 10),
            child: Text(
              titleListView[index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.1,
              ),
            ),
          ),
          subtitle: Text(
            subtitleListView[index],
            style: const TextStyle(
              color: Color(0xffe1e1e1),
              letterSpacing: 1.1,
              fontSize: 11,
            ),
          ),
        );
      },
    );
  }
}

class MyBarGraph extends StatelessWidget {
  const MyBarGraph({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(
              left: 20, right: 20),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: [
                const Text(
                  '80',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height: 18 *
                        MediaQuery.of(context)
                            .size
                            .height /
                        1080),
                const Text(
                  '60',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height: 18 *
                        MediaQuery.of(context)
                            .size
                            .height /
                        1080),
                const Text(
                  '40',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height: 18 *
                        MediaQuery.of(context)
                            .size
                            .height /
                        1080),
                const Text(
                  '20',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                    height: 18 *
                        MediaQuery.of(context)
                            .size
                            .height /
                        1080),
                const Text(
                  '0',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: screenWidth * 0.2,
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      const MyColumnBar(
                        percentage: 20,
                        color: Color(0xffeffcef),
                      ),
                      SizedBox(
                          width: 16 *
                              MediaQuery.of(context)
                                  .size
                                  .width /
                              1920),
                      const MyColumnBar(
                        percentage: 30,
                        color: Color(0xff85a088),
                      ),
                      SizedBox(
                          width: 16 *
                              MediaQuery.of(context)
                                  .size
                                  .width /
                              1920),
                      const MyColumnBar(
                        percentage: 80,
                        color: Color(0xffeffcef),
                      ),
                      SizedBox(
                          width: 16 *
                              MediaQuery.of(context)
                                  .size
                                  .width /
                              1920),
                      const MyColumnBar(
                        percentage: 40,
                        color: Color(0xff85a088),
                      ),
                      SizedBox(
                          width: 16 *
                              MediaQuery.of(context)
                                  .size
                                  .width /
                              1920),
                      const MyColumnBar(
                        percentage: 20,
                        color: Color(0xffeffcef),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TopGridView extends StatelessWidget {
  const TopGridView({
    super.key,
    required this.icon,
    required this.views,
    required this.numbers,
    required this.days,
    this.crossAxisCount = 3,
  });

  final List<IconData?> icon;
  final List<String> views;
  final List<String> numbers;
  final List<String> days;
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      scrollDirection: Axis.vertical,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.only(left: 40, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xffe3e0d3),
                child: Icon(
                  icon[index],
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 14 * MediaQuery.of(context).size.height / 1080),
              Text(
                views[index],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  letterSpacing: 1.25,
                ),
              ),
              SizedBox(height: 8 * MediaQuery.of(context).size.height / 1080),
              Text(
                numbers[index],
                style: const TextStyle(
                  fontSize: 38,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8 * MediaQuery.of(context).size.height / 1080),
              Text(
                days[index],
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  letterSpacing: 1.25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required GlobalKey<AnimatedCircularChartState> chartKey,
    required this.title,
    required this.title1,
    required this.title2,
    required this.number,
  }) : _chartKey = chartKey;

  final double screenWidth;
  final double screenHeight;
  final GlobalKey<AnimatedCircularChartState> _chartKey;
  final String title;
  final String title1;
  final String title2;
  final double number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.18,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        color: Colors.red.shade300,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Text(
                  title1,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                width: 130,
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.south_east),
                ),
              ),
              SizedBox(
                width: 130,
                child: AnimatedCircularChart(
                  key: _chartKey,
                  size: const Size(70, 70),
                  initialChartData: [
                    CircularStackEntry(
                      [
                        CircularSegmentEntry(
                          number,
                          Colors.black,
                        ),
                        CircularSegmentEntry(
                          35.0,
                          Colors.red.shade300,
                        ),
                      ],
                    ),
                  ],
                  holeLabel: number.toString(),
                  labelStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyColumnBar extends StatelessWidget {
  final Color? color;
  final double percentage;

  const MyColumnBar({
    super.key,
    required this.percentage,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final height =
        (MediaQuery.of(context).size.height * 0.25) * (percentage / 100);
    return Column(
      children: [
        Text(
          '${height.toInt()}',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(height: 12 * MediaQuery.of(context).size.height / 1080),
        Container(
          height: height,
          width: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}

extension EmptyPadding on num {
  SizedBox get ph {
    return SizedBox(height: toDouble());
  }

  SizedBox get pw {
    return SizedBox(width: toDouble());
  }
}
