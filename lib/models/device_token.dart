import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_token.freezed.dart';
part 'device_token.g.dart';

@freezed
class DeviceToken with _$DeviceToken {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DeviceToken({
    required String id,
    required String userId,
    required String token,
    required String platform,
    required DateTime createdAt,
  }) = _DeviceToken;

  factory DeviceToken.fromJson(Map<String, dynamic> json) => _$DeviceTokenFromJson(json);
}
