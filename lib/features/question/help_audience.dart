import 'package:do_an_di_dong/Utilities/indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HelpAudience extends StatefulWidget {
  final bool isTapFifty;
  final int indexCorrect;
  const HelpAudience(
      {Key? key, required this.isTapFifty, required this.indexCorrect})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    if (isTapFifty) {
      if (indexCorrect == 3 || indexCorrect == 2) {
        return HelpAudience_CD_State();
      }
      if (indexCorrect == 0 || indexCorrect == 1) {
        return HelpAudience_AB_State();
      }
    }
    return HelpAudienceState();
  }
}

class HelpAudienceState extends State {
  int touchedIndex = -1;

  int percentA = 0;
  int percentB = 0;
  int percentC = 0;
  int percentD = 0;

  @override
  Widget build(BuildContext context) {
    percentA = Random().nextInt(80) + 1;
    percentB = Random().nextInt(100 - percentA) + 1;
    percentC = Random().nextInt(100 - percentA - percentB) + 1;
    percentD = 100 - percentA - percentB - percentC;

    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Container(
              child: const Text('Kết quả Khảo Sát ý kiến khán giả'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: null,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 35,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'A',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'B',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'C',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'D',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: percentA.toDouble(),
            title: '$percentA%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: percentB.toDouble(),
            title: '$percentB%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: percentC.toDouble(),
            title: '$percentC%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: percentD.toDouble(),
            title: '$percentD%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

// làm tiếp tại đây
class HelpAudience_CD_State extends State {
  int touchedIndex = -1;

  int percentC = 0;
  int percentD = 0;

  @override
  Widget build(BuildContext context) {
    percentC = Random().nextInt(80) + 1;
    percentD = 100 - percentC;

    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Container(
              child: const Text('Kết quả Khảo Sát ý kiến khán giả'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: null,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 35,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff845bef),
                  text: 'C',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'D',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: percentC.toDouble(),
            title: '$percentC%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: percentD.toDouble(),
            title: '$percentD%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}

class HelpAudience_AB_State extends State {
  int touchedIndex = -1;

  int percentA = 0;
  int percentB = 0;

  @override
  Widget build(BuildContext context) {
    percentA = Random().nextInt(80) + 1;
    percentB = 100 - percentA;

    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 8,
            ),
            Container(
              child: Text('Kết quả Khảo Sát ý kiến khán giả'),
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: null,
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 35,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'A',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'B',
                  isSquare: true,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: percentA.toDouble(),
            title: '$percentA%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: percentB.toDouble(),
            title: '$percentB%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
