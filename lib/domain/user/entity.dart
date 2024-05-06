import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String email,
    required String name,
    required int id,
    required String website,
  }) = _User;

  const User._();

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  static String get collectionName => 'users';
}
