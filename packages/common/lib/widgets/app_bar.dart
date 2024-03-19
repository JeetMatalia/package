import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Custom AppBar',
        style: TextStyle(
          color: Colors.white, // Text color
          fontSize: 20.0, // Text size
          fontWeight: FontWeight.bold, // Text weight
        ),
      ),
      backgroundColor: Colors.green, // Background color
      elevation: 4, // Shadow elevation
      centerTitle: true, // Center align title
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white, // Icon color
        ),
        onPressed: () {
          // Add your onPressed logic here
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white, // Icon color
          ),
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: Colors.white, // Icon color
          ),
          onPressed: () {
            // Add your onPressed logic here
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
