class UserModel {
  String? firstName;
  String? lastName;
  String? role;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? photoProfile;
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;

  UserModel({
    this.role,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.createdAt,
    this.emailVerifiedAt,
    this.updatedAt,
    this.photoProfile,
  });

  factory UserModel.fromJson(Map<String, dynamic> data) {
    return UserModel(
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      role: data['role']?.toString(),
      emailVerifiedAt: data['email_verified_at'],
      photoProfile: data['photo_profile'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': '$firstName $lastName',
      'email': email,
      'role': role,
      'password': password,
      'password_confirmation': password,
    };
  }
}
