class FirebaseErrorMapper {
  static String map(Object error) {
    final message = error.toString();
    if (message.contains('invalid-credential')) {
      return 'E-posta veya şifre yanlış. Lütfen tekrar deneyin.';
    } else if (message.contains('network-request-failed')) {
      return 'İnternet bağlantınızı kontrol edin.';
    } else {
      return 'Bilinmeyen bir hata oluştu.';
    }
  }
}
