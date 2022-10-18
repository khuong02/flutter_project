import 'package:do_an_di_dong/models/user.dart';

class UserProvider {
  static User myuser = User(
    id: "us01",
    name: "Trần Phi Long",
    email: "tplong24@gmail.com",
    photo: "http://pngimg.com/uploads/google/google_PNG19635.png",
    ranking: 3,
    dateCreated: DateTime.now(),
    totalPlay: 55,
  );
}
