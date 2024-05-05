import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surrealdb/src/common/method.dart';
import 'package:surrealdb/src/common/typedefs.dart';
import 'package:uuid/uuid.dart';

part 'send.freezed.dart';
part 'send.g.dart';

@freezed
class Send with _$Send {
  @JsonSerializable(includeIfNull: false)
  const factory Send.def({
    ID? id,
    required Method method,
    Object? params,
  }) = _Send;

  factory Send({
    ID? id,
    required Method method,
    Object? params,
  }) {
    return _Send(method: method, id: const Uuid().v4(), params: params);
  }

  factory Send.fromJson(Map<String, dynamic> json) => _$SendFromJson(json);
}
