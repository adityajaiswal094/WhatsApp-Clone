import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUI/button_card.dart';
import 'package:whatsapp/CustomUI/contact_card.dart';
import 'package:whatsapp/model/chat.dart';
import 'package:whatsapp/pages/create_group.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(name: "Aditya Jaiswal", status: "Get a life."),
      ChatModel(name: "Jayant Jaiswal", status: "Busy"),
      ChatModel(name: "Rohit Jaiswal", status: "Calls only."),
      ChatModel(name: "Papa", status: "I am on whatsapp!"),
      ChatModel(name: "Mummy", status: "...."),
      ChatModel(name: "Napster", status: "Gamer!!!"),
      ChatModel(name: "Naruto", status: "Talk no Jutsu"),
      ChatModel(name: "Sasuke", status: "Rinnegan"),
      ChatModel(name: "Madara Uchicha", status: "Hashirama Love. UwU"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Select contact"),
            SizedBox(
              height: 3,
            ),
            Text(
              "50 contacts",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                debugPrint(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("Invite a friend"),
                    value: "Invite a friend",
                  ),
                  const PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  const PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  const PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => const CreateGroup())),
                child: const ButtonCard(
                  icon: Icons.group,
                  name: "New group",
                ),
              );
            } else if (index == 1) {
              return const ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            } else {
              return ContactCard(contacts: contacts[index - 2]);
            }
          }),
    );
  }
}
