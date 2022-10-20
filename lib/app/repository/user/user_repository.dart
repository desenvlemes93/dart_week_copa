import 'package:dart_week_copa/app/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getMe();
}
