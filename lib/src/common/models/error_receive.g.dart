// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ErrorReceiveImpl _$$ErrorReceiveImplFromJson(Map<String, dynamic> json) =>
    _$ErrorReceiveImpl(
      id: json['id'] as String?,
      method: $enumDecode(_$MethodEnumMap, json['method']),
      params: json['params'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ErrorReceiveImplToJson(_$ErrorReceiveImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['method'] = _$MethodEnumMap[instance.method]!;
  writeNotNull('params', instance.params);
  return val;
}

const _$MethodEnumMap = {
  Method.ping: 'ping',
  Method.use: 'use',
  Method.info: 'info',
  Method.signup: 'signup',
  Method.signin: 'signin',
  Method.authenticate: 'authenticate',
  Method.invalidate: 'invalidate',
  Method.let: 'let',
  Method.unset: 'unset',
  Method.live: 'live',
  Method.kill: 'kill',
  Method.query: 'query',
  Method.select: 'select',
  Method.create: 'create',
  Method.insert: 'insert',
  Method.update: 'update',
  Method.merge: 'merge',
  Method.patch: 'patch',
  Method.delete: 'delete',
};
