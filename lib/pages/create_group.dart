import 'package:flutter/material.dart';
import 'package:whatsapp/CustomUI/contact_card.dart';
import 'package:whatsapp/CustomUI/groupperson_addremove.dart';
import 'package:whatsapp/model/chat.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("New group"),
            SizedBox(
              height: 3,
            ),
            Text(
              "Add participants",
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
        ],
      ),
      body: Stack(children: [
        ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groups.isNotEmpty ? 85 : 0,
                );
              }
              return InkWell(
                  onTap: () {
                    if (contacts[index - 1].selected == false) {
                      setState(() {
                        contacts[index - 1].selected = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].selected = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  child: ContactCard(contacts: contacts[index - 1]));
            }),
        groups.isNotEmpty
            ? Column(
                children: [
                  Container(
                    height: 85,
                    color: Colors.transparent,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].selected == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  contacts[index].selected = false;
                                  groups.remove(contacts[index]);
                                });
                              },
                              child: PersonAddRemove(
                                contact: contacts[index],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                  ),
                  const Divider(
                    height: 0,
                    indent: 15,
                    endIndent: 15,
                  )
                ],
              )
            : Container(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.background,
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
    );
  }
}
