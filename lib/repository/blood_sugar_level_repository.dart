import 'package:blood_sugar_chart/data_source/local/json_local_data_source.dart';
import 'package:blood_sugar_chart/model/blood_sugar_level_data/blood_sugar_level_data.dart';
import 'package:get/get.dart';

class BloodSugarLevelRepository extends GetxService {
  BloodSugarLevelRepository({required JsonLocalDataSource jsonLocalDataSource})
      : _jsonLocalDataSource = jsonLocalDataSource;

  final JsonLocalDataSource _jsonLocalDataSource;

  Future<List<BloodSugarLevelData>> getBloodSugarLevelData() async {
    final response = await _jsonLocalDataSource.getBloodSugarLevelData();
    return response;
  }
}
