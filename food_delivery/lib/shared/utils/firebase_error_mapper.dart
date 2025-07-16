class FirebaseErrorMapper {
  static String map(Object error) {
    final message = error.toString();
    if (message.contains('invalid-credential')) {
      return 'Email or password is incorrect. Please try again.';
    } else if (message.contains('network-request-failed')) {
      return 'Network error. Please check your internet connection.';
    } else {
      return 'An unexpected error occurred. Please try again later.';
    }
  }
}
