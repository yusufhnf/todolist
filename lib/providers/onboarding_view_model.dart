import 'package:stacked/stacked.dart';
import 'package:todolist/configs/shared_preference.dart';

class OnBoardingViewModel extends BaseViewModel {
  bool _isSigned;
  bool get isSigned => _isSigned;
  String _getUser;
  String get getUser => _getUser;

  void checkUser() async {
    notifyListeners();
    _getUser = await SharedPreference.getEmail();
    _getUser == null ? _isSigned = false : _isSigned = true;
  }
}