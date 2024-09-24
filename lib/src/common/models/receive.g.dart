// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiveImpl _$$ReceiveImplFromJson(Map<String, dynamic> json) =>
    _$ReceiveImpl(
      id: json['id'] as String?,
      action: $enumDecodeNullable(_$LiveActionEnumMap, json['action']),
      result: json['result'],
      error: json['error'],
      status: json['status'] as String?,
      time: json['time'] as String?,
    );

Map<String, dynamic> _$$ReceiveImplToJson(_$ReceiveImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('action', _$LiveActionEnumMap[instance.action]);
  writeNotNull('result', instance.result);
  writeNotNull('error', instance.error);
  writeNotNull('status', instance.status);
  writeNotNull('time', instance.time);
  return val;
}

const _$LiveActionEnumMap = {
  LiveAction.delete: 'DELETE',
  LiveAction.create: 'CREATE',
  LiveAction.update: 'UPDATE',
};
