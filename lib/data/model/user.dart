enum Role { student, teacher }

class Token {
  String accessToken;
  String refreshToken;
  Token({
    this.accessToken,
    this.refreshToken,
  });

  @override
  String toString() =>
      'Token(accessToken: $accessToken, refreshToken: $refreshToken)';
}

class User {
  int id;
  String name;
  String phone;
  String email;
  Role role;
  Token token;

  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.role,
    this.token,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, phone: $phone, email: $email, role: $role, token: $token)';
  }
}
