class ErrorResponse {
  int? code;
  String? error;

  ErrorResponse({this.code, this.error});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['error'] = error;
    return data;
  }
}
