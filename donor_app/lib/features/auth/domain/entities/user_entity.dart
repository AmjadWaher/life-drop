class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String bloodType;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.bloodType,
  });

  String get fullName => '$firstName $lastName';
}
