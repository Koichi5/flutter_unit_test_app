import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(FirestoreRef ref) {
  final db = FirebaseFirestore.instance;
  if (db.settings.persistenceEnabled == false) {
    db.settings = const Settings(
      persistenceEnabled: true,
      cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
    );
  }
  return db;
}
