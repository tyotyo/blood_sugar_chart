import 'package:blood_sugar_chart/model/blood_sugar_level_data/blood_sugar_level_data.dart';
import 'package:blood_sugar_chart/view/line_chart/line_chart_view_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LineChartView extends StatelessWidget {
  const LineChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: LineChartViewController(),
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '목표혈당 설정',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Obx(
                    () => RangeSlider(
                      values: controller.targetBloodSugarLevel.value,
                      min: 0,
                      max: 200,
                      onChanged: controller.changeTargetBloodSugarLevel,
                      labels: controller.targetBloodSugarLevelLabel,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                      child: _buildLineChart(
                          context, controller.bloodSugarLevelData)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLineChart(
    BuildContext context,
    List<BloodSugarLevelData> data,
  ) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                final dateTime = DateTime.fromMillisecondsSinceEpoch(index);
                final dateFormat = DateFormat('a h');

                print('object : $dateTime');
                if ((dateTime.hour > 5 && dateTime.hour < 7) ||
                    (dateTime.hour > 11 && dateTime.hour < 13) ||
                    (dateTime.hour > 17 && dateTime.hour < 19)) {
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      dateFormat.format(dateTime),
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  );
                }

                return const SizedBox.shrink();
                // if (index < 0 || index >= data.length) {
                //   return const SizedBox.shrink();
                // }

                print('d: $dateFormat');
                // return SizedBox.shrink();
                // return SideTitleWidget(
                //   axisSide: meta.axisSide,
                //   child: Text(
                //     // dateFormat,
                //     style: TextStyle(
                //       color: Colors.black,
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              data.length,
              (index) {
                return FlSpot(
                  data[index].dateTime.millisecondsSinceEpoch.toDouble(),
                  data[index].level.toDouble(),
                );
              },
            ),
            barWidth: 4,
            dotData: const FlDotData(show: false),
            isStrokeCapRound: true,
            isStrokeJoinRound: true,
          ),
        ],
      ),
    );
  }
}
