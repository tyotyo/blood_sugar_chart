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
                      min: 80,
                      max: 200,
                      onChanged: controller.changeTargetBloodSugarLevel,
                      labels: controller.targetBloodSugarLevelLabel,
                    ),
                  ),
                  Obx(() => Text(
                      '${controller.targetBloodSugarLevel.value.start.round()} ~ ${controller.targetBloodSugarLevel.value.end.round()}')),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Obx(
                      () => _buildLineChart(
                        context,
                        controller: controller,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLineChart(
    BuildContext context, {
    required LineChartViewController controller,
  }) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                final dateTime = DateTime.fromMillisecondsSinceEpoch(index);
                final dateFormat = DateFormat('a h');

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
              },
            ),
          ),
        ),
        rangeAnnotations: RangeAnnotations(
          horizontalRangeAnnotations: [
            HorizontalRangeAnnotation(
              y1: controller.targetBloodSugarLevel.value.start,
              y2: controller.targetBloodSugarLevel.value.end,
              color: const Color(0XCCEFFFFF),
            ),
          ],
        ),
        lineBarsData: _getLineChartBarData(controller),
      ),
    );
  }

  List<LineChartBarData> _getLineChartBarData(
      LineChartViewController controller) {
    // 목표 혈당 초과
    final highLevel = controller.targetBloodSugarLevel.value.end;
    // 목표 혈당 미달
    final lowLevel = controller.targetBloodSugarLevel.value.start;

    // 목표 혈당에 대한 초과, 미달, 적정 구간에 대한 데이터들을 구간별로 나눠 담기 위한 리스트
    List<BloodSugarLevelDataSection> bloodSugarLevelDataSection = [];

    for (var bloodSugarLevel in controller.bloodSugarLevelData) {
      // 현재 데이터의 목표혈당 레벨
      var thisBloodSugarSectionLevel =
          _getSectionLevel(bloodSugarLevel, highLevel, lowLevel);

      // 첫번째 데이터의 경우 비어 있으므로 초기 데이터 생성
      if (bloodSugarLevelDataSection.isEmpty) {
        bloodSugarLevelDataSection.add(
          BloodSugarLevelDataSection(
            sectionLevel: thisBloodSugarSectionLevel,
            data: [bloodSugarLevel],
          ),
        );

        continue;
      }

      var lastSection = bloodSugarLevelDataSection.last;
      if (lastSection.sectionLevel == thisBloodSugarSectionLevel) {
        lastSection.data.add(bloodSugarLevel);
        continue;
      }

      bloodSugarLevelDataSection.add(
        BloodSugarLevelDataSection(
          sectionLevel: thisBloodSugarSectionLevel,
          data: [bloodSugarLevel],
        ),
      );
    }

    // 목표 혈당 구간별로 나뉜 리스트를 통해 차트 데이터 생성
    return bloodSugarLevelDataSection.map((section) {
      return LineChartBarData(
        spots: List.generate(section.data.length, (index) {
          return FlSpot(
            section.data[index].dateTime.millisecondsSinceEpoch.toDouble(),
            section.data[index].level.toDouble(),
          );
        }),
        barWidth: 4,
        dotData: const FlDotData(show: false),
        isStrokeCapRound: true,
        isStrokeJoinRound: true,
        color: section.sectionLevel == SectionLevel.target
            ? const Color(0XFF66DDDC)
            : null,
        gradient: section.sectionLevel == SectionLevel.high
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0XFFFFCD00),
                  Color(0XFF66DDDC),
                ],
              )
            : section.sectionLevel == SectionLevel.low
                ? const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFF66DDDC),
                      Color(0XFFFF8DA7),
                    ],
                  )
                : null,
        belowBarData: section.sectionLevel == SectionLevel.high
            ? BarAreaData(
                show: true,
                cutOffY: controller.targetBloodSugarLevel.value.end,
                applyCutOffY: true,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0XFFFFCD00),
                    Colors.white,
                  ],
                ),
              )
            : null,
        aboveBarData: section.sectionLevel == SectionLevel.low
            ? BarAreaData(
                show: true,
                cutOffY: controller.targetBloodSugarLevel.value.start,
                applyCutOffY: true,
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Color(0XFFFF8DA7),
                  ],
                ),
              )
            : null,
      );
    }).toList();
  }

  SectionLevel _getSectionLevel(
      BloodSugarLevelData data, double high, double low) {
    if (data.level > high) {
      return SectionLevel.high;
    }
    if (data.level < low) {
      return SectionLevel.low;
    }

    return SectionLevel.target;
  }
}

class BloodSugarLevelDataSection {
  BloodSugarLevelDataSection({
    required this.sectionLevel,
    required this.data,
  });

  final SectionLevel sectionLevel;
  final List<BloodSugarLevelData> data;
}

/// 목표 설정 구간
enum SectionLevel {
  high,
  target,
  low,
  ;
}
