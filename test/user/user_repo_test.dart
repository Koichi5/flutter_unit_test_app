import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/domain/user/entity.dart';

import '../db_manager/fake_repo/fake_db_manager.dart';
import 'fake_repo/fake_repo.dart';

void main() {
  group('Fake User Repo --', () {
    late FakeUserRepo repo;
    late FakeFirebaseFirestore fakeFirebaseFirestore;
    late FakeDbManager fakeDbManager;
    late User expectedUser;
    late List<User> expectedUserList;

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      fakeDbManager = FakeDbManager();
      repo = FakeUserRepo()
        ..instance = fakeFirebaseFirestore
        ..fakeDbManager = fakeDbManager;
    });

    setUpAll(() {
      expectedUser = const User(
        email: 'email',
        name: 'name',
        id: 1,
        website: 'website',
      );

      expectedUserList = const [
        User(
          email: 'email1',
          name: 'name1',
          id: 1,
          website: 'website1',
        ),
        User(
          email: 'email2',
          name: 'name2',
          id: 2,
          website: 'website2',
        ),
        User(
          email: 'email3',
          name: 'name3',
          id: 3,
          website: 'website3',
        ),
      ];
    });

    test('UserRepo に関して、ユーザーを正しい内容で保存できる', () async {
      final userId = await repo.save(
        email: expectedUser.email,
        name: expectedUser.name,
        id: expectedUser.id,
        website: expectedUser.website,
      );

      final savedUser =
          await fakeFirebaseFirestore.collection('users').doc(userId).get();
      final data = savedUser.data() ?? {};

      expect(User.fromJson(data), equals(expectedUser));
    });

    test('UserRepo に関して、保存したユーザーをIDで取得できる', () async {
      final userRef = await fakeFirebaseFirestore
          .collection('users')
          .add(expectedUser.toJson());

      final savedUser = await repo.fetchUserById(userRef.id);

      expect(savedUser, equals(expectedUser));
    });

    test('UserRepo に関して、追加したユーザーを監視して正しい個数だけ取得できる', () async {
      final collectionRef = fakeFirebaseFirestore.collection('users');
      final snapshots = collectionRef.snapshots();
      await collectionRef.add(expectedUser.toJson());
      await Future.delayed(const Duration(milliseconds: 300));

      snapshots.listen(expectAsync1((snap) {
        expect(snap.size, equals(1));
      }));
    });

    test('UserRepo に関して、ユーザーのデータをN個追加して、監視、取得するとN個だけ取得できる', () async {
      const dataLength = 10;
      final collectionRef = fakeFirebaseFirestore.collection('users');
      final snapshots = collectionRef.snapshots();
      for (int i = 0; i < dataLength; i++) {
        await collectionRef.add(expectedUser.toJson());
      }
      await Future.delayed(const Duration(milliseconds: 300));

      snapshots.listen(expectAsync1((snap) {
        expect(snap.size, equals(dataLength));
      }));
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、正しいデータの個数を取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchAllUserList(descending: false);
      expect(fetchedUserList.length, equals(3));
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、正しいデータを昇順で取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchAllUserList(descending: false);
      for (int i = 0; i < fetchedUserList.length; i++) {
        expect(fetchedUserList[i], expectedUserList[i]);
      }
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、正しいデータを降順で取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchAllUserList(descending: false);
      for (int i = fetchedUserList.length; i < fetchedUserList.length; i--) {
        expect(fetchedUserList[i], expectedUserList[i]);
      }
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、ローカルから正しいデータの個数を取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchLocalUserList(descending: false);
      expect(fetchedUserList.length, equals(3));
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、ローカルから正しいデータを昇順で取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchLocalUserList(descending: false);
      for (int i = 0; i < fetchedUserList.length; i++) {
        expect(fetchedUserList[i], expectedUserList[i]);
      }
    });

    test('UserRepo に関して、複数のユーザーのデータを保存して、ローカルから正しいデータを降順で取得できる', () async {
      for (final user in expectedUserList) {
        await fakeFirebaseFirestore.collection('users').add(user.toJson());
      }
      final fetchedUserList = await repo.fetchLocalUserList(descending: false);
      for (int i = fetchedUserList.length; i < fetchedUserList.length; i--) {
        expect(fetchedUserList[i], expectedUserList[i]);
      }
    });

    test('UserRepo に関して、ユーザーのデータを更新すると、更新した結果が反映されている', () async {
      const updatedUser = User(
        email: 'updated-email',
        name: 'updated-name',
        id: 1,
        website: 'updated-website',
      );

      final userRef = await fakeFirebaseFirestore
          .collection('users')
          .add(expectedUser.toJson());

      await repo.update(
        userId: userRef.id,
        email: updatedUser.email,
        name: updatedUser.name,
        id: updatedUser.id,
        website: updatedUser.website,
      );

      final savedUser =
          await fakeFirebaseFirestore.collection('users').doc(userRef.id).get();
      final data = savedUser.data() ?? {};

      expect(User.fromJson(data), equals(updatedUser));
    });

    test('UserRepo に関して、ユーザーを追加した後削除すると、当該ユーザーが削除されている', () async {
      final userRef = await fakeFirebaseFirestore
          .collection('users')
          .add(expectedUser.toJson());

      await repo.deleteUser(userRef.id);

      final savedUser =
          await fakeFirebaseFirestore.collection('users').doc(userRef.id).get();

      expect(savedUser.exists, equals(false));
    });
  });
}
