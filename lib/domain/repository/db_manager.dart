import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_manager.g.dart';

@Riverpod(keepAlive: true)
class DbManager extends _$DbManager {
  @override
  void build() {}

  // ローカルからデータを取得
  Future<List<T>> getLocalData<T>(Query<T> query) async => query
      .get(const GetOptions(source: Source.cache))
      .then((value) => value.docs.map((e) => e.data()).toList());

  // ローカル + サーバーからデータを取得
  Future<List<T>> getAllData<T>(
    Query<T> query,
  ) async =>
      _getQuery(query).then((query) async {
        final result = await query.get();
        print(result);
        return result;
      }).then((value) async {
        final data = await getLocalData(query);
        print(data);
        return data;
      });

  // ストリームを利用してデータの更新を監視
  Future<Stream<QuerySnapshot<T>>> streamLatestData<T>(
    Query<T> query,
  ) async =>
      _getQuery(query).then((query) => query.snapshots());

  // ローカルに無いのデータを取得するクエリを作成
  Future<Query<T>> _getQuery<T>(
    Query<T> query,
  ) async =>
      query.limit(1).get(const GetOptions(source: Source.cache)).then(
            (value) => value.docs.isEmpty
                ? query
                : query.endAtDocument(value.docs.first),
          );
}
