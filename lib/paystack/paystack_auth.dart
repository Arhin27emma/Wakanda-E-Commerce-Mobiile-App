class PaystackAuthResponse{
  final String authorizationUrl;
  final String accessCode;
  final String reference;

  PaystackAuthResponse({required this.authorizationUrl, required this.accessCode, required this.reference});

  factory PaystackAuthResponse.fromJson(Map<String, dynamic> json){
    return PaystackAuthResponse(
      authorizationUrl: json['authorizationUrl'], 
      accessCode: json['accessCode'], 
      reference: json['reference']
    );
  }

  Map<String, dynamic> tojson(){
    return{
      'authorizationUrl': authorizationUrl, 
      'accessCode': accessCode, 
      'reference': reference
    };
  }
}