import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/friend_obj.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FriendDetail extends StatelessWidget {
  FriendDetail({required this.myFriend, Key? key}) : super(key: key);
  FriendObj myFriend;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 90, 10, 10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      myFriend.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text(
                      myFriend.email,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Map<String, int> data = {
                            'user_id_second': myFriend.id,
                          };
                          Response res = await FriendApi().unfriend(data);
                          if (res.statusCode == 200) {
                            Navigator.pop(context);
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text("Unfriend successfully!"),
                                    ));
                          }
                        },
                        child: Text("Unfriend"),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Challenge"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(myFriend.avatar),
            ),
          ),
        ],
      ),
    );
  }
}
