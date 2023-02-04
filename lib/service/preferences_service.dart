import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
@preResolve
class PreferencesService {
  static const _cityKey = '_cityKey';

  final SharedPreferences prefs;
  PreferencesService._(this.prefs);

  @factoryMethod
  static Future<PreferencesService> getInstance() async {
    final prefs = await SharedPreferences.getInstance();
    return PreferencesService._(prefs);
  }

  String? getCity() => prefs.getString(_cityKey);

  Future<void> setCity(String city) async {
    await prefs.setString(_cityKey, city);
  }
}
