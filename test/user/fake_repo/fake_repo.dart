import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testing_app/domain/user/entity.dart';

import '../../db_manager/fake_repo/fake_db_manager.dart';

part 'fake_repo.g.dart';

@riverpod
class FakeUserRepo extends _$FakeUserRepo {
  late FakeFirebaseFirestore instance;
  late FakeDbManager fakeDbManager;

  @override
  void build() {
    instance = FakeFirebaseFirestore();
    fakeDbManager = FakeDbManager();
  }

  CollectionReference<User> get collection =>
      instance.collection(User.collectionName).withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  Future<String> save({
    required String email,
    required String name,
    required int id,
    required String website,
  }) async {
    final doc = collection.doc();
    final user = User(email: email, name: name, id: id, website: website);

    return doc.set(user, SetOptions(merge: true)).then((value) => doc.id);
  }

  Future<String> update({
    required String userId,
    required String email,
    required String name,
    required int id,
    required String website,
  }) async {
    final doc = collection.doc(userId);
    final user = User(email: email, name: name, id: id, website: website);

    return doc.set(user, SetOptions(merge: true)).then((value) => doc.id);
  }

  Future<User> fetchUserById(String userId) async =>
      collection.doc(userId).get().then((value) {
        if (value.data() == null) {
          throw Error();
        }
        return value.data()!;
      });

  Future<void> deleteUser(String userId) async =>
      collection.doc(userId).delete();

  Query<User> query({required bool descending}) {
    final query = collection.orderBy('id', descending: descending);
    return query;
  }

  Future<List<User>> fetchAllUserList({required bool descending}) async =>
      fakeDbManager.getAllData(query(descending: descending));

  Future<List<User>> fetchLocalUserList({required bool descending}) async =>
      fakeDbManager.getLocalData(query(descending: descending));

  Stream<DocumentSnapshot<User>> streamUser(String userId) =>
      collection.doc(userId).snapshots();
}
