import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testing_app/domain/repository/db_manager.dart';
import 'package:testing_app/domain/user/entity.dart';
import 'package:testing_app/providers/firebase_provider.dart';

part 'repo.g.dart';

@riverpod
class UserRepo extends _$UserRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);
  DbManager get dbManager => ref.read(dbManagerProvider.notifier);

  CollectionReference<User> get collection =>
      db.collection(User.collectionName).withConverter<User>(
            fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  @override
  void build() {}

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

  Query<User> _query({required bool descending}) {
    final query = collection
        .orderBy('id', descending: descending);
    return query;
  }

  Future<List<User>> fetchAllUserList({required bool descending}) async =>
      dbManager.getAllData(_query(descending: descending));

  Future<List<User>> fetchLocalUserList({required bool descending}) async =>
      dbManager.getLocalData(_query(descending: descending));

  Stream<DocumentSnapshot<User>> streamUser(String userId) =>
      collection.doc(userId).snapshots();
}
