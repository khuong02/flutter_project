class User {
  final String name;
  final String email;
  final String photo;
  final int cost;
  final int mode;
  final DateTime dateJoin;
  final int bestScore;

  User({
    required this.name,
    required this.email,
    required this.photo,
    required this.cost,
    required this.mode,
    required this.dateJoin,
    required this.bestScore,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json["user"]["username"],
        email = json["user"]["email"],
        photo = json["user"]["avatar"],
        cost = int.parse(json["user"]["cost"]),
        mode = json["mode"],
        dateJoin = DateTime.parse(json["user"]["created_at"]),
        bestScore = json["score"];
}
