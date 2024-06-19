import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({Key? key}) : super(key: key);

  BarChartGroupData generateGroupData(
    int x,
    double pilates,
    double quickWorkout,
    final color,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: [
        BarChartRodData(
          fromY: 0,
          toY: pilates,
          width: 15,
          color: color,
          borderRadius: BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(10))
        ),
        BarChartRodData(
          fromY: pilates,
          toY: pilates + quickWorkout,
          color: const Color.fromARGB(255, 218, 217, 217),
          width: 15,
          borderRadius: BorderRadius.vertical(bottom: Radius.zero, top: Radius.circular(10))
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
      child: Container(
        width: double.infinity,
        height: 200,
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(
              show: false,
            ),
            groupsSpace: 10,
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return SideTitleWidget(
                      axisSide: meta.axisSide,
                      child: Text(
                        value.toInt().toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  getTitlesWidget: (double value, TitleMeta meta) {
                    return Text(
                      value.toInt().toString(),
                      style: const TextStyle(fontSize: 12),
                    );
                  },
                ),
              ),
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 1,
              verticalInterval: 1,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Colors.grey,
                  strokeWidth: 0.5,
                  dashArray: [5, 5],
                );
              },
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: Colors.grey,
                  strokeWidth: 0.5,
                  dashArray: [5, 5],
                );
              },
            ),
            barGroups: [
              generateGroupData(0, 2, 5, Color(0xFFF24C15)),
              generateGroupData(1, 2, 5, Color(0xFFB464DA)),
              generateGroupData(2, 1, 6, Color(0xFFFFAC15)),
              generateGroupData(3, 3, 4, Color(0xFF1185EA)),
              generateGroupData(4, 4, 3, Color(0xFF1BA953)),
            ],
          ),
        ),
      ),
    );
  }
}
