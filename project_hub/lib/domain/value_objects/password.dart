class Password {
  final String value;

  Password(this.value) {
    if (value.length < 8) {
      throw const FormatException('Password must be at least 8 characters long');
    }
  }
}
