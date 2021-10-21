import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp/model/chat.dart';
import 'package:whatsapp/pages/message_page.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MessagePage(chatModel: chatModel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 28,
              child: SvgPicture.asset(
                chatModel.isGroup ? "assets/groups.svg" : "assets/person.svg",
                color: Colors.white,
                height: 37,
                width: 37,
              ),
              backgroundColor: Colors.grey,
            ),
            title: Text(
              chatModel.name,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all_outlined,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    chatModel.message,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            trailing: Text(
              chatModel.time,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MessagePage(
                            chatModel: chatModel,
                          )));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              height: 0,
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
