import 'package:freezed_annotation/freezed_annotation.dart';

part 'entity.freezed.dart';
part 'entity.g.dart';

@freezed
abstract class Producer with _$Producer {
  const factory Producer({
    required String producerId,
    required String areaId,
    required String name,
    required String icon,
  }) = _Producer;

  const Producer._();

  factory Producer.fromJson(Map<String, dynamic> json) =>
      _$ProducerFromJson(json);

  static String get collectionName => 'producers';

  static Producer get mock => const Producer(
        producerId: 'producerId',
        areaId: 'areaId',
        name: 'name',
        icon: 'icon',
      );
}
