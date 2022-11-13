class User {
  final int id;
  final String name;
  final String email;
  final String? photo;
  final int cost;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      this.photo,
      required this.cost});

  User.fromJson(Map<String, dynamic> json)
      : id = json["data"]["id"],
        name = json["data"]["username"],
        email = json["data"]["email"],
        photo = json["data"]["avatar"],
        cost = int.parse(json["data"]["cost"]);
}
