import 'dart:convert';

import 'package:blood_sugar_chart/model/blood_sugar_level_data/blood_sugar_level_data.dart';
import 'package:flutter/services.dart';

class JsonLocalDataSource {
  Future<List<BloodSugarLevelData>> getBloodSugarLevelData() async {
    final data = await _getLocalFileString('asset/data/data.json');

    if (data is List<dynamic>) {
      final bloodSugarLevels = data.map((e) {
        var bloodSugarLevelData = BloodSugarLevelData.fromJson(e);
        return bloodSugarLevelData;
      }).toList();
      return bloodSugarLevels;
    }

    return [];
  }

  Future<Object?> _getLocalFileString(String path) async {
    final response = await rootBundle.loadString(path);
    final data = await json.decode(response);
    return data;
  }
}
