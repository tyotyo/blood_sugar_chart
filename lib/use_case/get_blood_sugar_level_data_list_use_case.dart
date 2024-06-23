import 'package:blood_sugar_chart/model/blood_sugar_level_data/blood_sugar_level_data.dart';
import 'package:blood_sugar_chart/repository/blood_sugar_level_repository.dart';
import 'package:get/get.dart';

class GetBloodSugarLevelDataListUseCase {
  final _bloodSugarLevelRepository = Get.find<BloodSugarLevelRepository>();

  Future<List<BloodSugarLevelData>> call() async {
    try {
      var data = await _bloodSugarLevelRepository.getBloodSugarLevelData();
      return data;
    } catch (e, s) {
      print('error at [GetBloodSugarLevelDataListUseCase]: $e\n$s');
      return [];
    }
  }
}
