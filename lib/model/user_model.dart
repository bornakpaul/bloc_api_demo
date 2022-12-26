class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'] ?? 'dummy@gmail.com',
      firstName: json['first_name'] ?? 'First Name',
      lastName: json['last_name'] ?? 'Last Name',
      avatar: json['avatar'] ?? 'https://img.freepik.com/free-vector/cute-dog-cute-cat-cartoon-illustration_138676-3238.jpg?w=1380&t=st=1672076758~exp=1672077358~hmac=6d8eb348fc04e223f8b46860aea68c6102910afcd0a9f020c9a424a92dd58048',
    );
  }
}
