import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/domain/user/entity.dart';

void main() {
  test('User model test', () {
    const user = User(
      email: 'sample@email.com',
      name: 'user-name',
      id: 1,
      website: 'https://website.com',
    );

    expect(user.email, equals('sample@email.com'));
    expect(user.name, equals('user-name'));
    expect(user.id, equals(1));
    expect(user.website, equals('https://website.com'));
  });
}
