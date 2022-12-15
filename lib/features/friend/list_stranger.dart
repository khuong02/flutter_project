import 'package:do_an_di_dong/Utilities/loading/loading_sheet.dart';
import 'package:do_an_di_dong/Utilities/my_error/error_dialog.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Widgets/info_popup/friend_detail.dart';
import '../../models/friend_obj.dart';

class StrangerList extends StatefulWidget {
  const StrangerList({Key? key}) : super(key: key);

  @override
  State<StrangerList> createState() => _StrangerListState();
}

class _StrangerListState extends State<StrangerList> {
  late Future<List<FriendObj>> myList;

  Future<List<FriendObj>> getList() async {
    return FriendApi().getStrangerList();
  }

  @override
  void initState() {
    myList = getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FriendObj>>(
      future: myList,
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
                  trailing: ElevatedButton(
                    onPressed: () async {
                      LoadingSheet.show(context);
                      Map<String, int> data = {
                        'user_id_second': list[index].id,
                      };
                      var res = await FriendApi().addFriend(data);
                      if (res.statusCode == 200) {
                        Navigator.pop(context);
                        setState(() {
                          myList = getList();
                        });
                      } else {
                        Navigator.pop(context);
                        ErrorDialog.show(
                            context, "Fail to send friend request!");
                      }
                    },
                    child: Text("Add friend"),
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
