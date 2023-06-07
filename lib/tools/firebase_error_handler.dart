class FirebaseErrorHandler {
  static String getAuthErrorMessage({required String errorMessage}) {
    switch (errorMessage) {
      case "invalid-email":
        return 'Wrong email';
      case "wrong-password":
        return 'Wrong password';
      case "timeout":
        return 'Please, try again';
      case "user-not-found":
        return 'User not found';
      case "weak-password":
        return 'weak password';
    }
    return 'Something gone wrong :(';
  }
}
