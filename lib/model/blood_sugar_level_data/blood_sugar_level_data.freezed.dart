// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blood_sugar_level_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BloodSugarLevelData _$BloodSugarLevelDataFromJson(Map<String, dynamic> json) {
  return _BloodSugarLevelData.fromJson(json);
}

/// @nodoc
mixin _$BloodSugarLevelData {
  @JsonKey(name: 'x')
  int get seq => throw _privateConstructorUsedError;
  @JsonKey(name: 'y')
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'dt')
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BloodSugarLevelDataCopyWith<BloodSugarLevelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BloodSugarLevelDataCopyWith<$Res> {
  factory $BloodSugarLevelDataCopyWith(
          BloodSugarLevelData value, $Res Function(BloodSugarLevelData) then) =
      _$BloodSugarLevelDataCopyWithImpl<$Res, BloodSugarLevelData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'x') int seq,
      @JsonKey(name: 'y') int level,
      @JsonKey(name: 'dt') DateTime dateTime});
}

/// @nodoc
class _$BloodSugarLevelDataCopyWithImpl<$Res, $Val extends BloodSugarLevelData>
    implements $BloodSugarLevelDataCopyWith<$Res> {
  _$BloodSugarLevelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = null,
    Object? level = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BloodSugarLevelDataImplCopyWith<$Res>
    implements $BloodSugarLevelDataCopyWith<$Res> {
  factory _$$BloodSugarLevelDataImplCopyWith(_$BloodSugarLevelDataImpl value,
          $Res Function(_$BloodSugarLevelDataImpl) then) =
      __$$BloodSugarLevelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'x') int seq,
      @JsonKey(name: 'y') int level,
      @JsonKey(name: 'dt') DateTime dateTime});
}

/// @nodoc
class __$$BloodSugarLevelDataImplCopyWithImpl<$Res>
    extends _$BloodSugarLevelDataCopyWithImpl<$Res, _$BloodSugarLevelDataImpl>
    implements _$$BloodSugarLevelDataImplCopyWith<$Res> {
  __$$BloodSugarLevelDataImplCopyWithImpl(_$BloodSugarLevelDataImpl _value,
      $Res Function(_$BloodSugarLevelDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seq = null,
    Object? level = null,
    Object? dateTime = null,
  }) {
    return _then(_$BloodSugarLevelDataImpl(
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BloodSugarLevelDataImpl
    with DiagnosticableTreeMixin
    implements _BloodSugarLevelData {
  const _$BloodSugarLevelDataImpl(
      {@JsonKey(name: 'x') required this.seq,
      @JsonKey(name: 'y') required this.level,
      @JsonKey(name: 'dt') required this.dateTime});

  factory _$BloodSugarLevelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BloodSugarLevelDataImplFromJson(json);

  @override
  @JsonKey(name: 'x')
  final int seq;
  @override
  @JsonKey(name: 'y')
  final int level;
  @override
  @JsonKey(name: 'dt')
  final DateTime dateTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BloodSugarLevelData(seq: $seq, level: $level, dateTime: $dateTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BloodSugarLevelData'))
      ..add(DiagnosticsProperty('seq', seq))
      ..add(DiagnosticsProperty('level', level))
      ..add(DiagnosticsProperty('dateTime', dateTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BloodSugarLevelDataImpl &&
            (identical(other.seq, seq) || other.seq == seq) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, seq, level, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BloodSugarLevelDataImplCopyWith<_$BloodSugarLevelDataImpl> get copyWith =>
      __$$BloodSugarLevelDataImplCopyWithImpl<_$BloodSugarLevelDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BloodSugarLevelDataImplToJson(
      this,
    );
  }
}

abstract class _BloodSugarLevelData implements BloodSugarLevelData {
  const factory _BloodSugarLevelData(
          {@JsonKey(name: 'x') required final int seq,
          @JsonKey(name: 'y') required final int level,
          @JsonKey(name: 'dt') required final DateTime dateTime}) =
      _$BloodSugarLevelDataImpl;

  factory _BloodSugarLevelData.fromJson(Map<String, dynamic> json) =
      _$BloodSugarLevelDataImpl.fromJson;

  @override
  @JsonKey(name: 'x')
  int get seq;
  @override
  @JsonKey(name: 'y')
  int get level;
  @override
  @JsonKey(name: 'dt')
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$BloodSugarLevelDataImplCopyWith<_$BloodSugarLevelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
