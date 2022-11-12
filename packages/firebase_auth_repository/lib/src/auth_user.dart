import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photo;
  final int? cost;

  const AuthUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.cost,
  });

  static const empty = AuthUser(id: '');

  bool get isEmpty => this == AuthUser.empty;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photo,
        cost,
      ];
}
