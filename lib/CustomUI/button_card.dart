import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key? key, required this.name, required this.icon})
      : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.background,
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title: Text(
        name,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
    );
  }
}
