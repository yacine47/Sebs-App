String? validateRequiredField(String? value, String hint) {
  if (value == null || value.trim().isEmpty) {
    return 'Please enter your $hint';
  }
  return null;
}
