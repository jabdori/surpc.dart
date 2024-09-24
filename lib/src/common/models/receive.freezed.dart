// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Receive _$ReceiveFromJson(Map<String, dynamic> json) {
  return _Receive.fromJson(json);
}

/// @nodoc
mixin _$Receive {
  String? get id => throw _privateConstructorUsedError;
  LiveAction? get action => throw _privateConstructorUsedError;
  Object? get result => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiveCopyWith<Receive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveCopyWith<$Res> {
  factory $ReceiveCopyWith(Receive value, $Res Function(Receive) then) =
      _$ReceiveCopyWithImpl<$Res, Receive>;
  @useResult
  $Res call(
      {String? id,
      LiveAction? action,
      Object? result,
      Object? error,
      String? status,
      String? time});
}

/// @nodoc
class _$ReceiveCopyWithImpl<$Res, $Val extends Receive>
    implements $ReceiveCopyWith<$Res> {
  _$ReceiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? result = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as LiveAction?,
      result: freezed == result ? _value.result : result,
      error: freezed == error ? _value.error : error,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiveImplCopyWith<$Res> implements $ReceiveCopyWith<$Res> {
  factory _$$ReceiveImplCopyWith(
          _$ReceiveImpl value, $Res Function(_$ReceiveImpl) then) =
      __$$ReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      LiveAction? action,
      Object? result,
      Object? error,
      String? status,
      String? time});
}

/// @nodoc
class __$$ReceiveImplCopyWithImpl<$Res>
    extends _$ReceiveCopyWithImpl<$Res, _$ReceiveImpl>
    implements _$$ReceiveImplCopyWith<$Res> {
  __$$ReceiveImplCopyWithImpl(
      _$ReceiveImpl _value, $Res Function(_$ReceiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? action = freezed,
    Object? result = freezed,
    Object? error = freezed,
    Object? status = freezed,
    Object? time = freezed,
  }) {
    return _then(_$ReceiveImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as LiveAction?,
      result: freezed == result ? _value.result : result,
      error: freezed == error ? _value.error : error,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ReceiveImpl implements _Receive {
  const _$ReceiveImpl(
      {this.id, this.action, this.result, this.error, this.status, this.time});

  factory _$ReceiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiveImplFromJson(json);

  @override
  final String? id;
  @override
  final LiveAction? action;
  @override
  final Object? result;
  @override
  final Object? error;
  @override
  final String? status;
  @override
  final String? time;

  @override
  String toString() {
    return 'Receive(id: $id, action: $action, result: $result, error: $error, status: $status, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.time, time) || other.time == time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      action,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(error),
      status,
      time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveImplCopyWith<_$ReceiveImpl> get copyWith =>
      __$$ReceiveImplCopyWithImpl<_$ReceiveImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiveImplToJson(
      this,
    );
  }
}

abstract class _Receive implements Receive {
  const factory _Receive(
      {final String? id,
      final LiveAction? action,
      final Object? result,
      final Object? error,
      final String? status,
      final String? time}) = _$ReceiveImpl;

  factory _Receive.fromJson(Map<String, dynamic> json) = _$ReceiveImpl.fromJson;

  @override
  String? get id;
  @override
  LiveAction? get action;
  @override
  Object? get result;
  @override
  Object? get error;
  @override
  String? get status;
  @override
  String? get time;
  @override
  @JsonKey(ignore: true)
  _$$ReceiveImplCopyWith<_$ReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
