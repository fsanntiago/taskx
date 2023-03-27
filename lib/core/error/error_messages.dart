class ErrorMessages {
  static const String weakPassword = "The password provided is too weak.";
  static const String existAccount = "That email address is already in use.";
  static const String invalidLogin = "Incorrect name or password.";
  static const String userNotFound = "No user found for that email.";
  static const String tooManyRequests = "Too many requests. Try again later.";
  static const String operationNotAllowed =
      "Signing in with Email and Password is not enabled.";
  static const String userDisabled = "User with this email has been disabled.";
  static const String unexpectedError = "An unexcpected Error happened.";
  static const String invalidVerificationCode =
      "Invalid verification code, make sure that you are entering the correct code";
  static const String invalidVerificationId =
      "The verification ID used to create the phone auth credential is invalid";
  static const String networkConnectionFailed =
      "No internet connection please check your connection and try again.";
  static const String signInGoogleCanceled =
      "The user canceled the sign-in flow.";
  static const String missingGoogleIdToken = "Missing Google ID Token.";
}
