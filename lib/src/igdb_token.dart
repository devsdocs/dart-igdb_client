import 'dart:convert';

class IGDBToken {
  IGDBToken({this.accessToken, this.expiresIn, this.tokenType});

  factory IGDBToken.fromJson(String str) =>
      IGDBToken.fromMap(json.decode(str) as Map);

  factory IGDBToken.fromMap(Map map) => IGDBToken(
        accessToken: map['access_token'] as String?,
        expiresIn: map['expires_in'] as int?,
        tokenType: map['token_type'] as String?,
      );
  final String? accessToken;
  final int? expiresIn;
  final String? tokenType;

  @override
  String toString() => jsonEncode(toMap());
  Map toMap() => {
        'access_token': accessToken,
        'expires_in': expiresIn,
        'token_type': tokenType
      };
}
