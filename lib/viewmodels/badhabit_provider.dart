import 'package:flutter/cupertino.dart';
import 'package:myhabitsv2/models/badhabit_model.dart';
import 'package:myhabitsv2/services/badhabit_api.dart';

class BadHabitProvider extends ChangeNotifier {
  late BadHabitAPI _service;
  List<BadHabitModel> _badHabit = [];

  BadHabitProvider() {
    _service = BadHabitAPI();
    BadHabitAPI().getUserID();
    // _getDataContacts();
  }

  List<BadHabitModel> get badHabit {
    return [..._badHabit];
  }

  Future<void> getAllBadHabitData() async {
    final result = await _service.getAllBadHabitFromAPI();
    _badHabit = result;
    notifyListeners();
  }

  Future<void> add(BadHabitModel goodHabitModel) async {
    final result = await _service.postBadHabitToAPI(goodHabitModel);
    if (result.id != null) {
      _badHabit.add(result);
      notifyListeners();
    }
  }

  void delete(String id) async {
    final targetIndex = _badHabit.indexWhere((element) => element.id == id);
    if (targetIndex != -1) {
      final isSuccess = await _service.deleteHabitToAPI(id);
      if (isSuccess) {
        _badHabit.removeAt(targetIndex);
        notifyListeners();
      }
    }
  }
}
