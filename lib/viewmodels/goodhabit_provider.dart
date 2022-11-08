import 'package:flutter/material.dart';
import 'package:myhabitsv2/models/goodhabit_model.dart';
import 'package:myhabitsv2/services/goodhabit_api.dart';

class GoodHabitProvider with ChangeNotifier {
  late GoodHabitAPI _service;
  List<GoodHabitModel> _goodHabit = [];

  GoodHabitProvider() {
    _service = GoodHabitAPI();
    GoodHabitAPI().getUserID();
  }

  List<GoodHabitModel> get goodHabit {
    return [..._goodHabit];
  }

  Future<void> getAllGoodHabitData() async {
    final result = await _service.getAllGoodHabitFromAPI();
    _goodHabit = result;
    notifyListeners();
  }

  Future<void> getAllGoodHabitDataPerDay() async {
    final result = await _service.getGoodHabitFromAPIPerDay();
    _goodHabit = result;
    notifyListeners();
  }

  Future<void> add(GoodHabitModel goodHabitModel) async {
    final result = await _service.postGoodHabitToAPI(goodHabitModel);
    if (result.id != null) {
      _goodHabit.add(result);
      notifyListeners();
    }
  }

  void update(GoodHabitModel goodHabitModel) async {
    final targetIndex =
        _goodHabit.indexWhere((element) => element.id == goodHabitModel.id);
    if (targetIndex != -1) {
      final isSuccess = await _service.editGoodHabitToAPI(goodHabitModel);
      if (isSuccess) {
        _goodHabit[targetIndex] = goodHabitModel;
        notifyListeners();
      }
    }
  }

  void delete(String id) async {
    final targetIndex = _goodHabit.indexWhere((element) => element.id == id);
    if (targetIndex != -1) {
      final isSuccess = await _service.deleteHabitToAPI(id);
      if (isSuccess) {
        _goodHabit.removeAt(targetIndex);
        notifyListeners();
      }
    }
  }
}
