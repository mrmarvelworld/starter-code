import 'package:starter_codes/core/state/base_state.dart';

class UserState extends BaseState {
  // final ProfileService _profileService;
  // final UserService _userService;
  // final LocalCache _localCache;

  // UserState(
  // this._profileService,
  // this._userService,
  // this._localCache,
  // ) {
  //gets user details immediately this is constructed
  // getUserDetails();
  // init();
  // }

  // late final ValueNotifier<AuthUserModel?> _user = ValueNotifier(null);
  // ValueNotifier<AuthUserModel?> get user => _user;

  // Future<void> getUserDetails() async {
  //   try {
  //     final userData = _localCache.getUserData();

  //     if (userData == null) return;
  //     _user.value = AuthUserModel.fromMap(userData);
  //   } catch (e) {
  //     handleError(e);
  //   }
  // }

  // void init() async {
  //   try {
  //     await getUserDetails();
  //   } catch (e) {
  //     //Todo: handle error
  //   }
  // }
}
