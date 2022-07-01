import 'package:hive/hive.dart';
import 'package:todo_bloc_hive/models/user.dart';

class AuthenticationService {
  late Box<User> _users;
  Future<void> init() async {
    Hive.registerAdapter(UserAdapter());
    _users = await Hive.openBox('usersBox');
  }

  Future<String> authenticatedUser(
      final String username, final String password) async {
    final success = _users.values.any((element) => (element.username ==
            username &&
        element.password ==
            password)); // This is a boolean variable => Returns : True or false
    if (success) {
      return username;
    } else {
      return "Authentication  error"; // we can also return null and make the function Null-able
    }
  }
}
