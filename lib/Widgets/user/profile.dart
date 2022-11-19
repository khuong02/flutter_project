import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String? imageUrl;
  final bool isEdit;
  final VoidCallback? onClicked;
  const ProfileWidget(
      {Key? key, this.onClicked, required this.imageUrl, this.isEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 4,
            right: 6,
            child: buildEdit(Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imageUrl!);
    return imageUrl != null
        ? ClipOval(
            child: Material(
              child: Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 120,
                height: 120,
                child: InkWell(
                  onTap: onClicked,
                ),
              ),
            ),
          )
        : ClipOval(
            child: Material(
              color: Colors.transparent,
              child: Ink.image(
                image: const NetworkImage(
                    "http://pngimg.com/uploads/google/google_PNG19635.png"),
                fit: BoxFit.cover,
                width: 120,
                height: 120,
              ),
            ),
          );
  }

  Widget buildEdit(Color color) => buildCircle(
        color: color,
        all: 3,
        child: buildCircle(
          all: 8,
          color: Colors.lightBlue,
          child: Icon(
            isEdit ? Icons.add_photo_alternate : Icons.edit,
            color: color,
            size: 20,
          ),
        ),
      );

  Widget buildCircle(
          {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
