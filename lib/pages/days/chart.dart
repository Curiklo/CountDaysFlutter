import 'dart:async';
import 'dart:math';

import 'package:CountDays/services/date_calculator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class DaysChart extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.lightBlue,
    Colors.pink,
    Colors.lightGreen,
    Colors.amber,
  ];

  @override
  State<StatefulWidget> createState() => DaysChartState();
}

class DaysChartState extends State<DaysChart> {
  final Color barBackgroundColor = Color(0xffffc1e3);
  final Duration animDuration = Duration(milliseconds: 250);
  VideoPlayerController audiocontroller;
  int touchedIndex;
  DateCalculator datecalculator = DateCalculator();

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audiocontroller = VideoPlayerController.asset('assets/audio/sample.mp3');
    audiocontroller.initialize();
    audiocontroller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    audiocontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Stack(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 5.0, left: 18.0, right: 40.0),
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
                      color: Colors.transparent,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isPlaying = !isPlaying;
                          if (isPlaying) {
                            refreshState();
                          }

                          audiocontroller.value.isPlaying
                              ? audiocontroller.pause()
                              : audiocontroller.play();
                          print('${audiocontroller.value}');
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color(0xfff48fb1),
    double width = 10,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 10 : y,
          color: isTouched ? Colors.lightBlue : barColor,
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
            return makeGroupData(0, datecalculator.graphyear(),
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, datecalculator.graphmonth(),
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, datecalculator.graphweek(),
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, datecalculator.graphday100(),
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, datecalculator.graphday1000(),
                isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    bool isDark = Provider.of<bool>(context);
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
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
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
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
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
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
            return makeGroupData(0, Random().nextInt(75).toDouble() + 40,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(75).toDouble() + 40,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(75).toDouble() + 40,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(75).toDouble() + 40,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(75).toDouble() + 40,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    if (this.mounted) {
      setState(() {});
    }
    await Future<dynamic>.delayed(animDuration + Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
