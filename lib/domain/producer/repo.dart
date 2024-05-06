import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testing_app/domain/producer/entity.dart';
import 'package:testing_app/providers/firebase_provider.dart';

part 'repo.g.dart';

@riverpod
class ProducerRepo extends _$ProducerRepo {
  FirebaseFirestore get db => ref.read(firestoreProvider);

  CollectionReference<Producer> get collection =>
      db.collection(Producer.collectionName).withConverter<Producer>(
            fromFirestore: (snapshot, _) => Producer.fromJson(snapshot.data()!),
            toFirestore: (data, _) => data.toJson(),
          );

  @override
  void build() {}

  Future<Producer> fetchProducerById(String producerId) async =>
      collection.doc(producerId).get().then((value) {
        if (value.data() == null) {
          throw Error();
        }
        return value.data()!;
      });

  Stream<DocumentSnapshot<Producer>> streamProducer(String producerId) =>
      collection.doc(producerId).snapshots();
}
