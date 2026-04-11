import 'package:json_annotation/json_annotation.dart';


part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  @JsonKey(name: "userId", defaultValue: "")
  final String id;
  @JsonKey(name: "userName", defaultValue: "")
  final String userName;
  @JsonKey(name: "fullName", defaultValue: "")
  final String fullName;
  @JsonKey(name: "email", defaultValue: "")
  final String email;
  @JsonKey(name: "phone", defaultValue: "")
  final String phoneNumber;
  @JsonKey(name: "roles", defaultValue: [])
  final List<String> roles;
  @JsonKey(name: "accessToken", defaultValue: "")
  final String token;
  @JsonKey(name: "refreshToken", defaultValue: "")
  final String refreshToken;
  @JsonKey(name: "requiresEmail", defaultValue: false)
  final bool requiresEmail;
  @JsonKey(name: "hasPin", defaultValue: false)
  final bool hasPin;

  AppUser({
    required this.id,
    required this.email,
    required this.phoneNumber,
    required this.roles,
    required this.token,
    required this.refreshToken,
    required this.userName,
    required this.fullName,
    required this.requiresEmail,
    required this.hasPin,
  });

  AppUser copyWith({
    String? id,
    String? email,
    String? fullName,
    String? userName,
    String? phoneNumber,
    List<String>? roles,
    String? token,
    String? refreshToken,
    bool? hasPin,
    bool? requiresEmail,
  }) => AppUser(
    id: id ?? this.id,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    roles: roles ?? this.roles,
    token: token ?? this.token,
    refreshToken: refreshToken ?? this.refreshToken,
    fullName: fullName ?? this.fullName,
    hasPin: hasPin ?? this.hasPin,
    requiresEmail: requiresEmail ?? this.requiresEmail,
    userName: userName ?? this.userName,
  );

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
