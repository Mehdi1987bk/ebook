class NoSuchEmailException implements Exception {
  String email;

  NoSuchEmailException({this.email});
}
