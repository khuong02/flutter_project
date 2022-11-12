class User {
  final int id;
  final String name;
  final String? email;
  final String? photo;
  final int? cost;

  const User(
      {required this.id,
      required this.name,
      this.email,
      this.photo,
      this.cost});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['username'],
      email: json["email"],
      photo: json["avatar"],
      cost: json["cost"],
    );
  }
}
