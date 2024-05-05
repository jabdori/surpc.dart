// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_receive.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ErrorReceive _$ErrorReceiveFromJson(Map<String, dynamic> json) {
  return _ErrorReceive.fromJson(json);
}

/// @nodoc
mixin _$ErrorReceive {
  String? get id => throw _privateConstructorUsedError;
  Method get method => throw _privateConstructorUsedError;
  Map<String, dynamic>? get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? id, Method method, Map<String, dynamic>? params)
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, Method method, Map<String, dynamic>? params)?
        def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, Method method, Map<String, dynamic>? params)?
        def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorReceive value) def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorReceive value)? def,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorReceive value)? def,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ErrorReceiveCopyWith<ErrorReceive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorReceiveCopyWith<$Res> {
  factory $ErrorReceiveCopyWith(
          ErrorReceive value, $Res Function(ErrorReceive) then) =
      _$ErrorReceiveCopyWithImpl<$Res, ErrorReceive>;
  @useResult
  $Res call({String? id, Method method, Map<String, dynamic>? params});
}

/// @nodoc
class _$ErrorReceiveCopyWithImpl<$Res, $Val extends ErrorReceive>
    implements $ErrorReceiveCopyWith<$Res> {
  _$ErrorReceiveCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? method = null,
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ErrorReceiveImplCopyWith<$Res>
    implements $ErrorReceiveCopyWith<$Res> {
  factory _$$ErrorReceiveImplCopyWith(
          _$ErrorReceiveImpl value, $Res Function(_$ErrorReceiveImpl) then) =
      __$$ErrorReceiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, Method method, Map<String, dynamic>? params});
}

/// @nodoc
class __$$ErrorReceiveImplCopyWithImpl<$Res>
    extends _$ErrorReceiveCopyWithImpl<$Res, _$ErrorReceiveImpl>
    implements _$$ErrorReceiveImplCopyWith<$Res> {
  __$$ErrorReceiveImplCopyWithImpl(
      _$ErrorReceiveImpl _value, $Res Function(_$ErrorReceiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? method = null,
    Object? params = freezed,
  }) {
    return _then(_$ErrorReceiveImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as Method,
      params: freezed == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$ErrorReceiveImpl implements _ErrorReceive {
  const _$ErrorReceiveImpl(
      {this.id, required this.method, final Map<String, dynamic>? params})
      : _params = params;

  factory _$ErrorReceiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorReceiveImplFromJson(json);

  @override
  final String? id;
  @override
  final Method method;
  final Map<String, dynamic>? _params;
  @override
  Map<String, dynamic>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ErrorReceive.def(id: $id, method: $method, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorReceiveImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, method, const DeepCollectionEquality().hash(_params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorReceiveImplCopyWith<_$ErrorReceiveImpl> get copyWith =>
      __$$ErrorReceiveImplCopyWithImpl<_$ErrorReceiveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String? id, Method method, Map<String, dynamic>? params)
        def,
  }) {
    return def(id, method, params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? id, Method method, Map<String, dynamic>? params)?
        def,
  }) {
    return def?.call(id, method, params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? id, Method method, Map<String, dynamic>? params)?
        def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(id, method, params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ErrorReceive value) def,
  }) {
    return def(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ErrorReceive value)? def,
  }) {
    return def?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ErrorReceive value)? def,
    required TResult orElse(),
  }) {
    if (def != null) {
      return def(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorReceiveImplToJson(
      this,
    );
  }
}

abstract class _ErrorReceive implements ErrorReceive {
  const factory _ErrorReceive(
      {final String? id,
      required final Method method,
      final Map<String, dynamic>? params}) = _$ErrorReceiveImpl;

  factory _ErrorReceive.fromJson(Map<String, dynamic> json) =
      _$ErrorReceiveImpl.fromJson;

  @override
  String? get id;
  @override
  Method get method;
  @override
  Map<String, dynamic>? get params;
  @override
  @JsonKey(ignore: true)
  _$$ErrorReceiveImplCopyWith<_$ErrorReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
