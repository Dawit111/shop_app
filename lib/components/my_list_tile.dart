import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final IconData icon;

  const MyListTile(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.grey,
        ),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
