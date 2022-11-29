import 'package:get_storage/get_storage.dart';
import 'package:my_home/data/keys/app_keys.dart';
import 'package:my_home/models/ui_models/user.dart';

class LocalSource {
  LocalSource._();

  static LocalSource? _instance;

  factory LocalSource() => _instance ?? LocalSource._();

  final _localStorage = GetStorage();

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else {
      return LocalSource._();
    }
  }

  User getProfile() {
    final user = User(
      username: _localStorage.read(AppKeys.USERNAME),
      email: _localStorage.read(AppKeys.EMAIL),
      sessionToken: _localStorage.read(AppKeys.SESSION_TOKEN),
      gender: _localStorage.read(AppKeys.IS_MALE),
      isAdmin: _localStorage.read(AppKeys.IS_ADMIN),
      isEmailVerified: _localStorage.read(AppKeys.IS_EMAIL_VERIFIED),
    );
    return user;
  }

  Future<void> setProfile(User user) async {
    await _localStorage.write(AppKeys.HAS_PROFILE, true);
    await _localStorage.write(AppKeys.USERNAME, user.username ?? '');
    await _localStorage.write(AppKeys.EMAIL, user.email ?? '');
    await _localStorage.write(AppKeys.IS_ADMIN, user.isAdmin ?? false);
    await _localStorage.write(
        AppKeys.IS_EMAIL_VERIFIED, user.isEmailVerified ?? false);
    await setGender(user.gender ?? true);
    await _localStorage.write(
      AppKeys.SESSION_TOKEN,
      user.sessionToken ??
          _localStorage.read<String>(AppKeys.SESSION_TOKEN) ??
          '',
    );
  }

  Future<void> removeProfile() async {
    await _localStorage.write(AppKeys.HAS_PROFILE, false);
    await _localStorage.remove(AppKeys.USERNAME);
    await _localStorage.remove(AppKeys.EMAIL);
    await _localStorage.remove(AppKeys.SESSION_TOKEN);
    await _localStorage.remove(AppKeys.IS_ADMIN);
  }

  bool hasProfile() {
    return _localStorage.read(AppKeys.HAS_PROFILE) ?? false;
  }

  Future<void> setIntroShowStatus({bool? value}) async {
    await _localStorage.write(AppKeys.IS_INTRO_SHOWED, value ?? true);
  }

  bool isIntroShowed() {
    return _localStorage.read(AppKeys.IS_INTRO_SHOWED) ?? false;
  }

  Future<void> setAdminStatus(bool value) async {
    await _localStorage.write(AppKeys.IS_ADMIN, value);
  }

  bool isAdmin() {
    return _localStorage.read(AppKeys.IS_ADMIN) ?? false;
  }

  Future<void> setGender(bool value) async {
    await _localStorage.write(AppKeys.IS_MALE, value);
  }

  bool getGender() {
    return _localStorage.read(AppKeys.IS_MALE) ?? true;
  }
}
