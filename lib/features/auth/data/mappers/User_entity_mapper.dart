import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

extension UserEntityMapper on UserModel{

  UserEntity get toEntity => UserEntity(name: name, email: email, role: role);

}