import 'dart:convert';

class IGDBResponse {

  IGDBResponse(this.status, this.error, this.data);
  /// Http status code of the request
  final int status;

  /// Object containing error information about the request. Will be null if
  /// the request was successful.
  final dynamic error;

  /// Object containing the resulting objects returned from IGDB's API. Will 
  /// be null if the request encountered an error.
  final List<dynamic>? data;

  bool isSuccess() {
    return status == 200 && error == null;
  }

  Map toMap() {
    return {'status': status, 'error': error, 'data': data};
  }

  @override
  String toString() {
    return toJson();
  }

  String toJson() {
    return json.encode(toMap());
  }
}
