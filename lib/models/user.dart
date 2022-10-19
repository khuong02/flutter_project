class User {
  final String id;
  final String name;
  final String email;
  final String photo;
  final int ranking;
  final int totalPlay;
  final DateTime dateCreated;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.ranking,
    required this.totalPlay,
    required this.dateCreated,
  });
}
