class LogoutResponse {
  final int responseCode;
  final String responseStatus;
  final String responseMessage;
  final String data;

  LogoutResponse({
    required this.responseCode,
    required this.responseStatus,
    required this.responseMessage,
    required this.data,
  });

  factory LogoutResponse.fromJson(Map<String, dynamic> json) {
    return LogoutResponse(
      responseCode: json['responseCode'],
      responseStatus: json['responseStatus'],
      responseMessage: json['responseMessage'],
      data: json['data'],
    );
  }
}
