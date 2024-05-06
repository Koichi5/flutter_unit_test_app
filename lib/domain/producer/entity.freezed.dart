// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Producer _$ProducerFromJson(Map<String, dynamic> json) {
  return _Producer.fromJson(json);
}

/// @nodoc
mixin _$Producer {
  String get producerId => throw _privateConstructorUsedError;
  String get areaId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProducerCopyWith<Producer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProducerCopyWith<$Res> {
  factory $ProducerCopyWith(Producer value, $Res Function(Producer) then) =
      _$ProducerCopyWithImpl<$Res, Producer>;
  @useResult
  $Res call({String producerId, String areaId, String name, String icon});
}

/// @nodoc
class _$ProducerCopyWithImpl<$Res, $Val extends Producer>
    implements $ProducerCopyWith<$Res> {
  _$ProducerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producerId = null,
    Object? areaId = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      producerId: null == producerId
          ? _value.producerId
          : producerId // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProducerImplCopyWith<$Res>
    implements $ProducerCopyWith<$Res> {
  factory _$$ProducerImplCopyWith(
          _$ProducerImpl value, $Res Function(_$ProducerImpl) then) =
      __$$ProducerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String producerId, String areaId, String name, String icon});
}

/// @nodoc
class __$$ProducerImplCopyWithImpl<$Res>
    extends _$ProducerCopyWithImpl<$Res, _$ProducerImpl>
    implements _$$ProducerImplCopyWith<$Res> {
  __$$ProducerImplCopyWithImpl(
      _$ProducerImpl _value, $Res Function(_$ProducerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? producerId = null,
    Object? areaId = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$ProducerImpl(
      producerId: null == producerId
          ? _value.producerId
          : producerId // ignore: cast_nullable_to_non_nullable
              as String,
      areaId: null == areaId
          ? _value.areaId
          : areaId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProducerImpl extends _Producer {
  const _$ProducerImpl(
      {required this.producerId,
      required this.areaId,
      required this.name,
      required this.icon})
      : super._();

  factory _$ProducerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProducerImplFromJson(json);

  @override
  final String producerId;
  @override
  final String areaId;
  @override
  final String name;
  @override
  final String icon;

  @override
  String toString() {
    return 'Producer(producerId: $producerId, areaId: $areaId, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProducerImpl &&
            (identical(other.producerId, producerId) ||
                other.producerId == producerId) &&
            (identical(other.areaId, areaId) || other.areaId == areaId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, producerId, areaId, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProducerImplCopyWith<_$ProducerImpl> get copyWith =>
      __$$ProducerImplCopyWithImpl<_$ProducerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProducerImplToJson(
      this,
    );
  }
}

abstract class _Producer extends Producer {
  const factory _Producer(
      {required final String producerId,
      required final String areaId,
      required final String name,
      required final String icon}) = _$ProducerImpl;
  const _Producer._() : super._();

  factory _Producer.fromJson(Map<String, dynamic> json) =
      _$ProducerImpl.fromJson;

  @override
  String get producerId;
  @override
  String get areaId;
  @override
  String get name;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$ProducerImplCopyWith<_$ProducerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
