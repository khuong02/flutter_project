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
    return HelpAudienceState();
  }
}

class HelpAudienceState extends State<HelpAudience> {
  int touchedIndex = -1;

  int percent1 = 0;
  int percent2 = 0;
  int percent3 = 0;
  int percent4 = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.isTapFifty) {
      percent1 = Random().nextInt(65) + 1;
      percent2 = 100 - percent1;
    } else {
      percent1 = Random().nextInt(80) + 1;
      percent2 = Random().nextInt(100 - percent1) + 1;
      percent3 = Random().nextInt(100 - percent1 - percent2) + 1;
      percent4 = 100 - percent1 - percent2 - percent3;
    }

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
            const Text('Kết quả Khảo Sát ý kiến khán giả'),
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
                    sections: showingSections4(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.isTapFifty
                  ? widget.indexCorrect == 3 || widget.indexCorrect == 2
                      ? const <Widget>[
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
                        ]
                      : const <Widget>[
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
                        ]
                  : const <Widget>[
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

  List<PieChartSectionData> showingSections4() {
    return List.generate(
      4,
      (i) {
        final isTouched = i == touchedIndex;
        final fontSize = isTouched ? 25.0 : 16.0;
        final radius = isTouched ? 60.0 : 50.0;
        switch (i) {
          case 0:
            return PieChartSectionData(
              color: const Color(0xff0293ee),
              value: percent1.toDouble(),
              title: '$percent1%',
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
              value: percent2.toDouble(),
              title: '$percent2%',
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
              value: percent3.toDouble(),
              title: '$percent3%',
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
              value: percent4.toDouble(),
              title: '$percent4%',
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
      },
    );
  }
}
