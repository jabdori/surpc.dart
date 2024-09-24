import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:surrealdb/src/common/typedefs.dart';

part 'receive.freezed.dart';

part 'receive.g.dart';

enum LiveAction {
  @JsonValue('DELETE')
  delete,
  @JsonValue('CREATE')
  create,
  @JsonValue('UPDATE')
  update,
}

@freezed
class Receive with _$Receive {
  @JsonSerializable(includeIfNull: false)
  const factory Receive({
    ID? id,
    LiveAction? action,
    Object? result,
    Object? error,
    String? status,
    String? time,
  }) = _Receive;

  factory Receive.fromJson(Map<String, Object?> json) =>
      _$ReceiveFromJson(json);
}
