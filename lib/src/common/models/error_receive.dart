import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surrealdb/src/common/method.dart';
import 'package:surrealdb/src/common/typedefs.dart';
import 'package:uuid/uuid.dart';

part 'error_receive.freezed.dart';
part 'error_receive.g.dart';

@freezed
class ErrorReceive with _$ErrorReceive {
  @JsonSerializable(includeIfNull: false)
  const factory ErrorReceive.def({
    ID? id,
    required Method method,
    DataMap? params,
  }) = _ErrorReceive;

  factory ErrorReceive({
    ID? id,
    required Method method,
    DataMap? params,
  }) {
    return _ErrorReceive(method: method, id: const Uuid().v4(), params: params);
  }

  factory ErrorReceive.fromJson(Map<String, dynamic> json) =>
      _$ErrorReceiveFromJson(json);
}
