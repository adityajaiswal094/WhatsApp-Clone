import 'package:whatsapp/pages/camera_page.dart';
import 'package:whatsapp/pages/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'camera_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        elevation: 1.7,
        shadowColor: Colors.black,
        actions: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              onSelected: (value) {
                debugPrint(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("New group"),
                    value: "New group",
                  ),
                  const PopupMenuItem(
                    child: Text("New broadcast"),
                    value: "New broadcast",
                  ),
                  const PopupMenuItem(
                    child: Text("WhatsApp web"),
                    value: "WhatsApp web",
                  ),
                  const PopupMenuItem(
                    child: Text("Starred messages"),
                    value: "Starred messages",
                  ),
                  const PopupMenuItem(
                    child: Text("Settings"),
                    value: "Settings",
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          indicatorColor: Theme.of(context).colorScheme.onPrimary,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(controller: _tabController, children: const <Widget>[
        CameraPage(),
        ChatMessages(),
        Center(
          child: Text("Status"),
        ),
        Center(
          child: Text("Call Logs"),
        ),
      ]),
    );
  }
}
