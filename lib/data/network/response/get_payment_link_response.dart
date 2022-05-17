class GetPaymentLinkResponse {
  final String url;

  GetPaymentLinkResponse(this.url);

  factory GetPaymentLinkResponse.fromJson(Map<String, dynamic> json) =>
      GetPaymentLinkResponse(
        json['data'] ['url'] as String,
      );
}
