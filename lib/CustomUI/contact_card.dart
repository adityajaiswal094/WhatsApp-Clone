import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/model/chat.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, required this.contacts}) : super(key: key);
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 48,
        width: 45,
        child: Stack(children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.blueGrey[200],
            child: SvgPicture.asset(
              "assets/person.svg",
              color: Colors.white,
              height: 30,
              width: 30,
            ),
          ),
          contacts.selected
              ? const Positioned(
                  bottom: 4,
                  right: 5,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.teal,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 13,
                    ),
                  ),
                )
              : Container(),
        ]),
      ),
      title: Text(
        contacts.name,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contacts.status,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
