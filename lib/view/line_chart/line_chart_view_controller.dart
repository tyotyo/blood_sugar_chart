import 'package:blood_sugar_chart/model/blood_sugar_level_data/blood_sugar_level_data.dart';
import 'package:blood_sugar_chart/use_case/get_blood_sugar_level_data_list_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LineChartViewController extends GetxController {
  final _getBloodSugarLevelDataList = GetBloodSugarLevelDataListUseCase();

  final RxList<BloodSugarLevelData> bloodSugarLevelData = RxList();

  final Rx<RangeValues> targetBloodSugarLevel = const RangeValues(100, 120).obs;

  RangeLabels get targetBloodSugarLevelLabel => RangeLabels(
        targetBloodSugarLevel.value.start.round().toString(),
        targetBloodSugarLevel.value.end.round().toString(),
      );

  @override
  void onInit() async {
    _initBloodSugarLevelDataList();
    super.onInit();
  }

  void changeTargetBloodSugarLevel(RangeValues rangeValues) {
    targetBloodSugarLevel(rangeValues);
  }

  void _initBloodSugarLevelDataList() async {
    var data = await _getBloodSugarLevelDataList();
    bloodSugarLevelData(data);
  }
}
