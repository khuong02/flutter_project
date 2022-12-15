class FriendObj {
  final int id;
  final String name;
  final String avatar;
  final String email;
  // final int status;

  // status = 0 show add friend, status == 1 show pending, status == 2 show friend
  FriendObj(
    this.id,
    this.avatar,
    this.name,
    this.email,
    // this.status,
  );

  FriendObj.fromJson(Map<String, dynamic> json)
      : id = int.parse(json["id"]),
        name = json["name"],
        avatar = json["avatar"],
        email = json["email"];
  // status = int.parse(json["status"]);
}
