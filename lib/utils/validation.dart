bool validateEmail(String email) {
  // Regular expression pattern for email validation
  const pattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';

  // Create a RegExp object from the pattern
  final regex = RegExp(pattern);

  // Check if the email matches the pattern
  return regex.hasMatch(email);
}
