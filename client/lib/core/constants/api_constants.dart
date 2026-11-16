class ApiConstants {
  static const String baseUrl = 'http://${String.fromEnvironment('ALB_DNS_NAME')}';
  static const String ordersEndpoint = '$baseUrl/orders';

  // Timeout settings
  static const Duration connectTimeout = Duration(seconds: 5);
  static const Duration receiveTimeout = Duration(seconds: 10);

  // Headers
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Error messages
  static const String networkErrorMessage = 'Network error. Please check your connection.';
  static const String serverErrorMessage = 'Server error. Please try again later.';
  static const String invalidResponseMessage = 'Invalid response from server.';
}