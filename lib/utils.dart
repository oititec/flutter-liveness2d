enum Environment {
  hml,
  prd;

  String get string {
    switch (this) {
      case Environment.hml:
        return 'hml';
      case Environment.prd:
        return 'prd';
    }
  }
}

enum MethodResponse {
  success,
  error;

  static MethodResponse getMethod(String? value) {  
    switch (value) {
      case 'oiti.response.ok':
        return MethodResponse.success;
      case 'oiti.response.error':
        return MethodResponse.error;
      default:
        return MethodResponse.error;
    }
  }
}
