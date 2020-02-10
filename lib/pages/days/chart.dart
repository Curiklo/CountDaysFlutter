import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DaysChart extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  @override
  State<StatefulWidget> createState() => DaysChartState();
}

class DaysChartState extends State<DaysChart> {
  final Color barBackgroundColor = Colors.pink[100];
  final Duration animDuration = Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 18.0, right: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: BarChart(
                        isPlaying ? randomData() : mainBarData(),
                        swapAnimationDuration: animDuration,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.pinkAccent,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        isPlaying = !isPlaying;
                        if (isPlaying) {
                          refreshState();
                        }
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color(0xFFFF00FF),
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 10 : y,
          color: isTouched ? Colors.yellow : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 100,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 50, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 65, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 95, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 30, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 85, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Year';
                  break;
                case 1:
                  weekDay = 'Month';
                  break;
                case 2:
                  weekDay = 'Week';
                  break;
                case 3:
                  weekDay = 'Day100';
                  break;
                case 4:
                  weekDay = 'Day1000';
                  break;
              }
              return BarTooltipItem(weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(color: Colors.yellow));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 1,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Y';
              case 1:
                return 'M';
              case 2:
                return 'W';
              case 3:
                return 'Dh';
              case 4:
                return 'Dk';
              default:
                return '';
            }
          },
        ),
        leftTitles: const SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: const BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 1,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'Y';
              case 1:
                return 'M';
              case 2:
                return 'W';
              case 3:
                return 'DH';
              case 4:
                return 'DK';
              default:
                return '';
            }
          },
        ),
        leftTitles: const SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(5, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(75).toDouble() + 30,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(75).toDouble() + 30,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(75).toDouble() + 30,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(75).toDouble() + 30,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(75).toDouble() + 30,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(animDuration + Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
