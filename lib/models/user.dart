// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    String? id,
    String? userLogin,
    String? userPass,
    String? userNicename,
    String? userEmail,
    String? userUrl,
    DateTime? userRegistered,
    String? userActivationKey,
    String? userStatus,
    String? displayName,
  });

  String? id;
  String? userLogin;
  String? userPass;
  String? userNicename;
  String? userEmail;
  String? userUrl;
  DateTime? userRegistered;
  String? userActivationKey;
  String? userStatus;
  String? displayName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["ID"],
        userLogin: json["user_login"],
        userPass: json["user_pass"],
        userNicename: json["user_nicename"],
        userEmail: json["user_email"],
        userUrl: json["user_url"],
        userRegistered: DateTime.parse(json["user_registered"]),
        userActivationKey: json["user_activation_key"],
        userStatus: json["user_status"],
        displayName: json["display_name"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "user_login": userLogin,
        "user_pass": userPass,
        "user_nicename": userNicename,
        "user_email": userEmail,
        "user_url": userUrl,
        "user_registered": userRegistered?.toIso8601String(),
        "user_activation_key": userActivationKey,
        "user_status": userStatus,
        "display_name": displayName,
      };
}
