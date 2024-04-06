class FirebaseErrorHandler {
  static String getAuthErrorMessage({required String errorMessage}) {
    switch (errorMessage) {
      case "invalid-email":
        return 'Wrong email';

      case "wrong-password":
        return 'Wrong password';

      case "The password is invalid or the user does not have a password.":
        return 'The password is invalid or the user does not have a password.';

      case "timeout":
        return 'Please, try again';

      case "user-not-found":
        return 'User not found';

      case "weak-password":
        return 'weak password';
        
      case "email-already-in-use":
        return 'Email is already registered';
    }
    return 'Something wrong, sorry';
  }
}
