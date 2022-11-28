class User {
  final String name;
  final String email;
  final String photo;
  final int cost;

  User(
      {required this.name,
      required this.email,
      required this.photo,
      required this.cost});

  User.fromJson(Map<String, dynamic> json)
      : name = json["username"],
        email = json["email"],
        photo = json["avatar"],
        cost = int.parse(json["cost"]);
}
