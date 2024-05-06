import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_db_manager.g.dart';

@Riverpod(keepAlive: true)
class FakeDbManager extends _$FakeDbManager {
  @override
  void build() {}

  Future<List<T>> getLocalData<T>(Query<T> query) async => query
      .get(const GetOptions(source: Source.cache))
      .then((value) => value.docs.map((e) => e.data()).toList());

  Future<List<T>> getAllData<T>(
    Query<T> query,
  ) async =>
      _getQuery(query).then((query) async {
        final result = await query.get();
        return result;
      }).then((value) async {
        final data = await getLocalData(query);
        return data;
      });

  Future<Stream<QuerySnapshot<T>>> streamLatestData<T>(
    Query<T> query,
  ) async =>
      _getQuery(query).then((query) => query.snapshots());

  Future<Query<T>> _getQuery<T>(
    Query<T> query,
  ) async =>
      query.limit(1).get(const GetOptions(source: Source.cache)).then(
            (value) => value.docs.isEmpty
                ? query
                : query.endAtDocument(value.docs.first),
          );
}
