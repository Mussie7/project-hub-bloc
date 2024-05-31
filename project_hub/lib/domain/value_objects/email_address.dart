class EmailAddress {
  final String value;

  EmailAddress(this.value) {
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      throw const FormatException('Invalid email address');
    }
  }
}
