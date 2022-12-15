import 'package:do_an_di_dong/Utilities/loading/loading_sheet.dart';
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
                    leading: Image.network(list[index].avatar),
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
                    trailing: SizedBox(
                      width: 96,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.red,
                            onPressed: () async {
                              LoadingSheet.show(context);
                              Map<String, dynamic> data = {
                                'user_id_second': list[index].id,
                                'accept': false,
                              };
                              var res = await FriendApi().responseFriend(data);
                              if (res.statusCode == 200) {
                                refreshPage();
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.done),
                            color: Colors.green,
                            onPressed: () async {
                              LoadingSheet.show(context);
                              Map<String, dynamic> data = {
                                'user_id_second': list[index].id,
                                'accept': true,
                              };
                              var res = await FriendApi().responseFriend(data);
                              if (res.statusCode == 200) {
                                refreshPage();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
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

  refreshPage() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ListFriendPending()));
  }
}
