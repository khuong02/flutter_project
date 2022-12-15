import 'package:do_an_di_dong/Widgets/info_popup/friend_detail.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/models/friend_obj.dart';
import 'package:flutter/material.dart';

class ListFriendPending extends StatefulWidget {
  const ListFriendPending({Key? key}) : super(key: key);

  @override
  State<ListFriendPending> createState() => _ListFriendPendingState();
}

class _ListFriendPendingState extends State<ListFriendPending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Friends Request")),
      body: FutureBuilder<List<FriendObj>>(
        future: FriendApi().getFriendListPending(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(list![index].avatar),
                    title: Text(list[index].name),
                    subtitle: Text(list[index].email),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => FriendDetail(
                          myFriend: list[index],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
