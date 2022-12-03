class LeaderBoardObj {
  final int? id;
  final int? time;
  final int? quantity;
  final int? score;
  final String? username;
  final String? email;
  final String? avatar;

  LeaderBoardObj(this.id, this.time, this.quantity, this.score, this.username, this.email, this.avatar);

  LeaderBoardObj.fromJson(Map<String, dynamic> json)
      : id = int.parse(json["user_id"]),
        username = json["username"],
        email = json["email"],
        avatar = json["avatar"],
        time = int.parse(json["time"]),
        quantity = int.parse(json["quantity"]),
        score = int.parse(json["score"]);
}
