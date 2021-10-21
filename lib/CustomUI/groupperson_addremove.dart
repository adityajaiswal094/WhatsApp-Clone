import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/model/chat.dart';

class PersonAddRemove extends StatelessWidget {
  const PersonAddRemove({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueGrey[200],
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blueGrey[400],
                child: const Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 14,
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 2,
          ),
          Text(
            contact.name,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
