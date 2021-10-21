import 'package:whatsapp/CustomUI/chat_view.dart';
import 'package:whatsapp/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/pages/contacts.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({Key? key}) : super(key: key);

  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.chat,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => const ContactsPage()));
        },
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => ChatView(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
